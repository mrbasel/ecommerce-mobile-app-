import 'package:ecom_app/services/auth.dart';
import 'package:flutter/material.dart';


class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FlutterLogo(size: 120),
              margin: EdgeInsets.only(bottom: 25),
            ),
            OutlineButton(
                child: Text('Sign in with Google'),
                color: Colors.green,
                onPressed: () {
                  signInWithGoogle().then((value) =>
                      Navigator.pushReplacementNamed(context, '/main'));
                })
          ],
        )),
      ),
    );
  }
}
