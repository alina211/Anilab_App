const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');

admin.initializeApp();

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'admin@gmail.com',
    pass: 'adminPass123', //
  },
});

exports.sendContactFormNotification = functions.firestore
  .document('contact_forms/{docId}')
  .onCreate((snap, context) => {
    const data = snap.data();

    const mailOptions = {
      from: 'user@gmail.com',
      to: 'adminPass123@gmail.com',
      subject: 'New Contact Form Submission',
      text: `Name: ${data.name}\nEmail: ${data.email}\nMessage: ${data.message}\nSubmitted At: ${data.submittedAt.toDate()}`,
    };

    return transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log('Error sending email:', error);
      } else {
        console.log('Email sent:', info.response);
      }
    });
  });




// /**
//  * Import function triggers from their respective submodules:
//  *
//  * import {onCall} from "firebase-functions/v2/https";
//  * import {onDocumentWritten} from "firebase-functions/v2/firestore";
//  *
//  * See a full list of supported triggers at https://firebase.google.com/docs/functions
//  */
//
// import {onRequest} from "firebase-functions/v2/https";
// import * as logger from "firebase-functions/logger";
//
// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// // export const helloWorld = onRequest((request, response) => {
// //   logger.info("Hello logs!", {structuredData: true});
// //   response.send("Hello from Firebase!");
// // });
