import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/pages/home_page.dart';
import 'package:loginapp/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //User is logged in
            return HomePage();
          } else {
            // User is not logged in
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
