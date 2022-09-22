// eslint-disable-next-line import/no-unresolved
const { FieldValue } = require('firebase-admin/firestore');
const admin = require('../..');

const initFCM = () => {
  try {
    const dbRef = admin.firestore();

    return dbRef;
  } catch (error) {
    console.log(error);
    return null;
  }
};

exports.insertAll = async (data) => {
  const db = initFCM();
  const promise = [];

  //   console.log(db);

  Object.keys(data).forEach((x) => {
    const keys = {
      country: x,
      //   subCountries: 'teste',
      subCountries: FieldValue.arrayUnion(...data[x]),
    };

    promise.push(db.collection('data-csv').doc(x).set(keys));
  });

  return Promise.allSettled(promise);
};
