import 'package:firebase_example_app/screen/login/login_screen.dart';
import 'package:firebase_example_app/screen/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  PageController controller = PageController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  TextEditingController inputCanfirmationPassword = TextEditingController();
  TextEditingController inputPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                  color: Color(0xFFE3EAF2)),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5040FA)),
                                    ),
                                    Text(
                                      'with',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade300),
                                    ),
                                    const Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5040FA)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            WTextField(text: 'Phone', controller: inputPhone),
                            const SizedBox(
                              height: 12,
                            ),
                            WTextField(
                              text: 'Passowrd',
                              controller: inputPassword,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            WTextField(
                              text: 'CanfirmationPassword',
                              controller: inputCanfirmationPassword,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color(0xFF5040FA),
                              ),
                              child: const Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5040FA)),
                                    ),
                                    Text(
                                      'with',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade300),
                                    ),
                                    const Text(
                                      'Phone',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5040FA)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            WTextField(
                              text: 'Email',
                              controller: inputEmail,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            WTextField(
                              text: 'Password',
                              controller: inputPassword,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            WTextField(
                              text: 'Confirmation Password',
                              controller: inputCanfirmationPassword,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color(0xFF5040FA),
                              ),
                              child: const Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
