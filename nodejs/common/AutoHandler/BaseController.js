class BaseHandler {
  event = null;

  context = null;

  env = process.env;

  async handle(event, context, method, isHttpResponse = true) {
    this.setFunctionContext(event, context);

    if (!(await this.isAuthorized())) {
      return BaseHandler.httpResponse(401, JSON.stringify({
        statusCode: 401,
        message: 'Unauthorized!',
      }));
    }

    try {
      const response = await this[method](event, context);

      return isHttpResponse
        ? BaseHandler.httpResponse(
          response.statusCode,
          typeof response.body === 'string'
            ? response.body
            : JSON.stringify(response.body),
          response.headers,
        )
        : response;
    } catch (err) {
      const message = err.response && err.response.data
        ? err.response.data
        : err.message || err;

      return BaseHandler.httpResponse(500, message);
    }
  }

  static httpResponse(statusCode, body, headers = {}) {
    return {
      statusCode,
      body,
      headers,
    };
  }

  isAuthorized() {
    const checkByAuthMethod = {
      header: this.authHeaderIsTheSameInTheEnvironment(),
    }[this.env.authMethod];

    if (checkByAuthMethod === undefined) {
      return true;
    }
    return checkByAuthMethod;
  }

  setFunctionContext(event, context) {
    this.event = event;
    this.context = context;
    process.env.sourceIpAddress = event.requestContext
      && event.requestContext.identity
      && event.requestContext.identity.sourceIp
      ? event.requestContext.identity.sourceIp
      : null;
  }

  authHeaderIsTheSameInTheEnvironment() {
    if (this.event.headers === undefined) {
      return true;
    }
    return this.event.headers.Authorization === this.env.authToken;
  }
}

module.exports = BaseHandler;
