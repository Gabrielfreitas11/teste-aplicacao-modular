const axios = require('axios');

module.exports.request = async function request(options) {
  return axios(options).then(
    async (response) => response,
    async (error) => {
      throw error;
    },
  );
};
