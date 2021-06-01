import 'package:first_web_app/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400.0,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
