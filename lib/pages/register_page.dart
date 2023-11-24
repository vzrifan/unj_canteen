import 'package:unj_canteen/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign up user
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password do not match!")));
      return;
    }

    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282828),
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
                    image: AssetImage('assets/images/logo_apk.png'),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //create account message
                  const Text(
                    "Let's create account for you!",
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
                    height: 5,
                  ),

                  //confirm password textfield
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: "Confirm password",
                      obsecureText: true),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(onTap: signUp, text: "Sign Up"),

                  const SizedBox(
                    height: 30,
                  ),

                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already a member?",
                        style: TextStyle(color: Color(0xCCCCCCCC)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now",
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
