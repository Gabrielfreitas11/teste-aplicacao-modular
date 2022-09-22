enum LoadingApiStatus { idle, loading, fail, success }

extension LoadingApiStatusX on LoadingApiStatus {
  bool get inProgress => this == LoadingApiStatus.loading;

  bool get isSuccess => this == LoadingApiStatus.success;

  bool get isFailure => this == LoadingApiStatus.fail;

  bool get isIdle => this == LoadingApiStatus.idle;
}
