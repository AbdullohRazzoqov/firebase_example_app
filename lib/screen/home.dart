// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// //user  == null uzer mavjud emas
// class Homepage extends StatelessWidget {
//   Homepage({super.key});
//   TextEditingController inputEmail = TextEditingController();
//   TextEditingController passwordEmail = TextEditingController();
//   FirebaseAuth authUser = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//               icon: Icon(Icons.logout),
//               onPressed: () async {
//                 await authUser.signOut();
//                 print('logout');
//               },
//             )
//           ],
//           backgroundColor: Colors.cyan,
//           title: const Text('Firebase'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: inputEmail,
//                 decoration: InputDecoration(
//                     hintText: 'email', border: OutlineInputBorder()),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               TextFormField(
//                 controller: passwordEmail,
//                 decoration: InputDecoration(
//                     hintText: 'password', border: OutlineInputBorder()),
//               ),
//               SizedBox(
//                 height: 120,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print('bislldi');
//                   register('abs@gmail.com', '112233');
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 52,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Colors.cyan),
//                   child: const Center(child: Text('Register')),
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print('bislldi');
//                   login('abs@gmail.com', '112233');
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 52,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Colors.cyan),
//                   child: const Center(child: Text('Log In')),
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print('bislldi');
//                   resedPassword(
//                     'abs@gmail.com',
//                   );
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 52,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Colors.cyan),
//                   child: const Center(child: Text('Resed password')),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }

//   Future register(String email, String password) async {
//     try {
//       UserCredential _authUser = await authUser.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = _authUser.user;
//       // emailga tasdiqlash jo'natish
//       await user?.sendEmailVerification();
//       //email verified qilingan yoki yo'q tekshirish
//       print(user?.emailVerified);
//       print('USER: ${user!.email}');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }

//     // catch (e) {
//     //   print('error: $e');
//     // }
//   }

//   Future login(String email, String password) async {
//     if (authUser.currentUser == null) {
//       try {
//         UserCredential? login = await authUser.signInWithEmailAndPassword(
//             email: email, password: password);
//         print('LOGINBoldi: ${login.additionalUserInfo}');
//       } catch (e) {
//         print("LoginError: $e");
//       }
//     }
//   }

//   Future resedPassword(
//     String email,
//   ) async {
//     if (authUser.currentUser == null) {
//       try {
//         await authUser.sendPasswordResetEmail(
//           email: email,
//         );
//       } catch (e) {
//         print("LoginError: $e");
//       }
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final firebaseStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  _addValue();
                },
                child: Text('Add')),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                _readValue();
              },
              child: Text('Read')),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                _readValue();
              },
              child: Text('Read'))
        ],
      ),
    );
  }

  _addValue() {
    Map<String, dynamic> value = {"name": 'Abdulloh', "age": 12};
    try {
      //set
      // create
      firebaseStore.collection('users').doc().set(value).then((value) => print);
    } catch (e) {
      print('error: $e');
    }
  }

  _readValue() {
    firebaseStore
        .collection('users')
        .doc('wql47gJYnkMwAa0wnv0E')
        .get()
        .then((value) => print('get: ${value['name']}'));
  }

  _updateValue() {
    //setni o'zini ishlatadigan bo'lsak bitta item ni update qilib qolganini o'chirib yuboradi
    //setning ichidagi SetOptions(merge: true) qilib qo'yamiz
    Map<String, dynamic> value = {"name": 'Abdulloh', "age": 12};

    firebaseStore
        .collection('users')
        .doc()
        .set(
          value,
        )
        .then((value) => print);
  }
}
