import 'package:first_web_app/signup_screen.dart';
import 'package:first_web_app/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignUpScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
      },
    );
  }
}
