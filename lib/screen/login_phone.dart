import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//user  == null uzer mavjud emas
class LoginPhone extends StatelessWidget {
  LoginPhone({super.key});
  TextEditingController inputPhone = TextEditingController();
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
                controller: inputPhone,
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
                  registerPhone('abs@gmail.com', '112233');
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
            ],
          ),
        ));
  }

  Future registerPhone(String email, String password) async {
    try {
      await authUser.verifyPhoneNumber(
          phoneNumber: '+998901112233',
          verificationCompleted: (value) {
            print('verification is Completed');
          },
          verificationFailed: (v) {
            print('verification is Failed');
          },
          codeSent: (verificationId, resendToken) async {
            print('Code send');
            String code = '112233';
            PhoneAuthCredential phoneAuth = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: code);
                //profile ichidan parolni almashtirish kerak 
            // await authUser.confirmPasswordReset(code: code, newPassword: newPassword)
            await authUser.signInWithCredential(phoneAuth);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
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

  Future loginPhone(String email, String password) async {
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
