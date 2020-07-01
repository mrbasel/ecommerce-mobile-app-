import 'package:flutter/material.dart';

import 'package:ecom_app/screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/google_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => SigninScreen(),
        '/main': (context) => Home(),
        '/cart': (context) => CartScreen()
      },
    );
  }
}

