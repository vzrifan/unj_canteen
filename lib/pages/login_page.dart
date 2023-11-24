import 'package:unj_canteen/components/my_button.dart';
import 'package:unj_canteen/components/my_text_field.dart';
import 'package:unj_canteen/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  //logo
                  // Icon(
                  //   Icons.message,
                  //   size: 100,
                  //   color: Colors.grey[800],
                  // ),

                  Image(
                    image: const AssetImage('assets/images/logo_apk.png'),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //welcome back message
                  const Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(fontSize: 16, color: Color(0xCCCCCCCC)),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //email textfield
                  MyTextField(
                      controller: emailController,
                      hintText: "Email",
                      obsecureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfield
                  MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obsecureText: true),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(onTap: signIn, text: "Sign In"),

                  const SizedBox(
                    height: 50,
                  ),

                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?",
                        style: TextStyle(color: Color(0xCCCCCCCC)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xCCCCCCCC)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
