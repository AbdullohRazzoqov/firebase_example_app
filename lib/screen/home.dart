import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//user  == null uzer mavjud emas
class Homepage extends StatelessWidget {
  Homepage({super.key});
  TextEditingController inputEmail = TextEditingController();
  TextEditingController passwordEmail = TextEditingController();
  FirebaseAuth authUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authUser.signOut();
                print('logout');
              },
            )
          ],
          backgroundColor: Colors.cyan,
          title: const Text('Firebase'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: inputEmail,
                decoration: InputDecoration(
                    hintText: 'email', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: passwordEmail,
                decoration: InputDecoration(
                    hintText: 'password', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 120,
              ),
              GestureDetector(
                onTap: () {
                  print('bislldi');
                  register('abs@gmail.com', '112233');
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.cyan),
                  child: const Center(child: Text('Register')),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  print('bislldi');
                  login('abs@gmail.com', '112233');
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.cyan),
                  child: const Center(child: Text('Log In')),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  print('bislldi');
                  resedPassword(
                    'abs@gmail.com',
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.cyan),
                  child: const Center(child: Text('Resed password')),
                ),
              )
            ],
          ),
        ));
  }

  Future register(String email, String password) async {
    try {
      UserCredential _authUser = await authUser.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = _authUser.user;
      // emailga tasdiqlash jo'natish
      await user?.sendEmailVerification();
      //email verified qilingan yoki yo'q tekshirish
      print(user?.emailVerified);
      print('USER: ${user!.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    // catch (e) {
    //   print('error: $e');
    // }
  }

  Future login(String email, String password) async {
    if (authUser.currentUser == null) {
      try {
        UserCredential? login = await authUser.signInWithEmailAndPassword(
            email: email, password: password);
        print('LOGINBoldi: ${login.additionalUserInfo}');
      } catch (e) {
        print("LoginError: $e");
      }
    }
  }

  Future resedPassword(
    String email,
  ) async {
    if (authUser.currentUser == null) {
      try {
        await authUser.sendPasswordResetEmail(
          email: email,
        );
      } catch (e) {
        print("LoginError: $e");
      }
    }
  }
}
