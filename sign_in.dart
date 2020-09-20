import 'package:flutter/material.dart';
import 'package:localeyes_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        height: 70.0,
        child: FlatButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
            child: Text(
              'Sign in Anonymously',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          color: Color(0xFF362d54),
        ),
      ),
    );
  }
}
