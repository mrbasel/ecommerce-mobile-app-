import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(margin: EdgeInsets.all(20), child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void signIn(email, password) async {
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print('Logged in as ${user.user.email}');
      Navigator.pushReplacementNamed(
        context,
        '/main'
        // MaterialPageRoute(builder: (context) => Home(user: user.user.displayName,),) 
        );
    } catch (e) {
      print(e);
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
                child: TextFormField(
              decoration: InputDecoration(hintText: 'Username'),
              onSaved: (input) => _email = input,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Empty';
                }
                return null;
              },
            )),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onSaved: (input) => _password = input,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Empty';
                  }
                  return null;
                },
              ),
            ),
            FlatButton(
              child: Text('Login'),
              color: Colors.blueAccent,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(_email + _password);
                  signIn(_email, _password);
                }
              },
            )
          ],
        ));
  }
}

