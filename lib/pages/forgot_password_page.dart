// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/components/my_button.dart';
import 'package:loginapp/components/my_textfield.dart';
import 'package:loginapp/pages/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  final Function()? onTap;
  const ForgotPasswordPage({super.key, this.onTap});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  //Sign in user method
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password reset link sent! Check your mail."),
            );
          });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.code.toString()),
            );
          });
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              //Welcome text
              Text(
                'Reset Password',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              //username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //sign in
              MyButton(
                onTap: passwordReset,
                text: 'Reset Password',
              ),

              const SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
  }
}
