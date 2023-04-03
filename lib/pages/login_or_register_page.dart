import 'package:flutter/material.dart';
import 'package:loginapp/pages/login_page.dart';
import 'package:loginapp/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //Initial login page
  bool showLoginPage = true;

  //Toggle between login and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages ,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
