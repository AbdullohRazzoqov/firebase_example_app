importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

   /*Update with yours config*/
  const firebaseConfig = {
    apiKey: "AIzaSyAEf3RyPjBopBL8BoUuYORtzU6G6aGrVxs",
    authDomain: "fir-example-9766e.firebaseapp.com",
    projectId: "fir-example-9766e",
    storageBucket: "fir-example-9766e.appspot.com",
    messagingSenderId: "476972303494",
    appId: "1:476972303494:web:e2159e1fa327f5b8247d07",
    measurementId: "G-C0N4731CQQ"
 };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });