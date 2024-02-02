import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final firBase = Firebase.initializeApp();
    return Scaffold(
      body: FutureBuilder(
          future: firBase,
          builder: (context, AsyncSnapshot snapShot) {
            if (!snapShot.hasData) {
              return CircularProgressIndicator();
            } else if (snapShot.hasError) {
              return Text('error');
            } else {
              return Text("bog'landi");
            }
          }),
    );
  }
}
