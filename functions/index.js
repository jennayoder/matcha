
// // https://firebase.google.com/docs/functions/get-started
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
admin.initializeApp();

const SENDGRID_API_KEY = functions.config().sendgrid.key;
const sgMail = require('@sendgrid/mail');
sgMail.setApiKey(SENDGRID_API_KEY);

exports.commandEmail = functions.https.onCall(async (data, context) => {
    if (!context.auth && !context.auth.token.email) {
        throw new functions.https.HttpsError('failed-precondition', 'Must be logged in');
    }
    const msg = {
    to: data.emails, // Change to your recipient
    from: data.currentUser, // Change to your verified sender
    templateId: 'd-5f7f64cecc0241dab085d939611f6752',
    dynamic_template_data: {
        action: data.action,
        message: data.message,
        itemName: data.itemName,
        qrID: data.qrID,
    },
    }

    await sgMail
    .send(msg)
    .then(() => {
        console.log('Email sent')
    })
    .catch((error) => {
        console.error(error)
    })
});


// const serviceAccount = '../../firebase-service-account-key.json';
// const firebaseUrl = 'https://my-app.firebaseio.com';

// // Call this function like this:
// // copyCollection('customers', 'customers_backup').then(() => console.log('copy complete')).catch(error => console.log('copy failed. ' + error));

// firebaseAdmin.initializeApp({
//     credential: firebaseAdmin.credential.cert(require(serviceAccount)),
//     databaseURL: firebaseUrl
// });
// const firestore = firebaseAdmin.firestore();

// async function copyCollection(srcCollectionName, destCollectionName) {
//     const documents = await firestore.collection(srcCollectionName).get();
//     let writeBatch = admin.firestore().batch();
//     const destCollection = firestore.collection(destCollectionName);
//     let i = 0;
//     for (const doc of documents.docs) {
//         writeBatch.set(destCollection.doc(doc.id), doc.data());
//         i++;
//         if (i > 400) {  // write batch only allows maximum 500 writes per batch
//             i = 0;
//             console.log('Intermediate committing of batch operation');
//             await writeBatch.commit();
//             writeBatch = admin.firestore().batch();
//         }
//     }
//     if (i > 0) {
//         console.log('Firebase batch operation completed. Doing final committing of batch operation.');
//         await writeBatch.commit();
//     } else {
//         console.log('Firebase batch operation completed.');
//     }
// }

