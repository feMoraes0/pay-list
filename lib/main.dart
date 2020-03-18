import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/screens/forms/card_form_screen.dart';
import 'package:pay_list/screens/forms/payments_form_screen.dart';
import 'package:pay_list/screens/home_screen.dart';
import 'package:pay_list/screens/login_screen.dart';
import 'package:pay_list/screens/register_screen.dart';
import 'package:pay_list/screens/splash_screen.dart';
import 'package:pay_list/screens/wallet_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay List',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.amberAccent,
        primaryColor: Colors.indigoAccent,
        appBarTheme: AppBarTheme(
          color: Colors.amberAccent,
          elevation: 0.0,
          textTheme: TextTheme(  
            title: GoogleFonts.lato(
              fontSize: 26.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(48, 48, 48, 1.0),
        primaryColor: Colors.indigo,
      ),
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home': (context) => HomeScreen(),
        'wallet': (context) => WalletScreen(),
        'payment_form': (context) => PaymentsFormScreen(),
        'card_form': (context) => CardFormScreen(),
      },
      home: SplashScreen(),
    );
  }
}
