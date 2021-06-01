import 'package:first_web_app/animation_progress_indicator.dart';
import 'package:first_web_app/welcome_screen.dart';

import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _fNameController = TextEditingController();
  final _sNameController = TextEditingController();
  final _usernameController = TextEditingController();

  double _fromProgress = 0;

  void _updateformProgress() {
    double progress = 0.0;
    final controllers = [
      _fNameController,
      _sNameController,
      _usernameController,
    ];

    for (var controller in controllers) {
      if (controller.text.isNotEmpty) {
        progress += 1 / controllers.length;
        print(progress);
      }
    }

    setState(() {
      _fromProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed(WelcomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateformProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimationProgressIndicator(
            value: _fromProgress,
          ),
          Text(
            'SignUp',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _fNameController,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _sNameController,
              decoration: InputDecoration(hintText: 'Second Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white,
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.disabled)
                    ? null
                    : Colors.blue,
              ),
            ),
            onPressed: _fromProgress == 1 ? _showWelcomeScreen : null,
            child: Text('Sing up'),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
