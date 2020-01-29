import "package:flutter/material.dart";
import "package:pay_list/screens/app.dart";
import 'package:pay_list/screens/settings.dart';
import "package:pay_list/screens/new_payments.dart";
import "package:pay_list/screens/register.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pay List",
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
        "settings": (context) => Settings(),
        "register": (context) => Register(),
        "new": (context) => NewPayments(),
        "app": (context) => AppScreen(),
      },
      home: Register(),
    );
  }
}