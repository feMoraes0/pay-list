import "package:flutter/material.dart";
import "package:pay_list/screens/app/app.dart";
import "package:pay_list/screens/new/new_payments.dart";
import "package:pay_list/screens/register/register.dart";

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
        primaryColor: Colors.redAccent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
      ),
      routes: {
        "register": (context) => Register(),
        "new": (context) => NewPayments(),
        "app": (context) => AppScreen(),
      },
      home: Register(),
    );
  }
}
