
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
