const admin = require('firebase-admin');

const serviceAccount = require('./credentials/testsmashflutter-firebase-adminsdk-hjrh7-1a8236b9ed.json');

if (!admin.apps.length) {
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://testsmashflutter.firebaseio.com',
  });
}

module.exports = admin;
