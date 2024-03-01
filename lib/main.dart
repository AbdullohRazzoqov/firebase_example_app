import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example_app/firebase_options.dart';
import 'package:firebase_example_app/screen/home.dart';
import 'package:firebase_example_app/screen/login_phone.dart';
import 'package:firebase_example_app/screen/register/register_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyAEf3RyPjBopBL8BoUuYORtzU6G6aGrVxs",
      projectId: "fir-example-9766e",
      storageBucket: "fir-example-9766e.appspot.com",
      messagingSenderId: "476972303494",
      appId: "1:476972303494:web:e2159e1fa327f5b8247d07",
    ));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final notificationSettings = await FirebaseMessaging.instance
            .requestPermission(provisional: true);

        final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken != null) {}

        final fcmToken = await FirebaseMessaging.instance.getToken(
            vapidKey:
                "BMW2pne_g6yC7rMrhZumWRWgIusS2b2EBQjKF5-ol9FXHlDVw6LgmU5iPhX4c--pWZXtp9kPlZEN-zdvD6B5a2M");
        print('fcmToken: $fcmToken');

        FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
          // TODO: If necessary send token to application server.

          // Note: This callback is fired at each app startup and whenever a new
          // token is generated.
        }).onError((err) {
          // Error getting token.
        });
      }),
    );
  }
}
