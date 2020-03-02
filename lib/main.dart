import 'package:flutter/material.dart';
import 'package:pay_list/screens/app.dart';
import 'package:pay_list/screens/delete.dart';
import 'package:pay_list/screens/login_screen.dart';
import 'package:pay_list/screens/new_payments.dart';
import 'package:pay_list/screens/register_screen.dart';
import 'package:pay_list/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay List',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.indigoAccent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(48, 48, 48, 1.0),
        primaryColor: Colors.indigo,
      ),
      routes: {
        'new': (context) => NewPayments(),
        'app': (context) => AppScreen(),
        'delete': (context) => DeleteScreen(),

        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
      },
      home: LoginScreen(),
    );
  }
}