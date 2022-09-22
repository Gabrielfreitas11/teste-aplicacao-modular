const { insertAll } = require('../../../../../common/firebase/functions/firestore');

exports.importAllData = async (data) => {
  const response = await insertAll(data);

  return response;
};
