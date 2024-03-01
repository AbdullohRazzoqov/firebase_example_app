importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyD1K7kyZpROOf5JRoV4AZbciay6ONcSRrw",
    authDomain: "pms-app-4c367.firebaseapp.com",
    projectId: "pms-app-4c367",
    storageBucket: "pms-app-4c367.appspot.com",
    messagingSenderId: "646624453056",
    appId: "1:646624453056:web:0506028af88e7b44512825",
    measurementId: "G-N43412GNSC"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});