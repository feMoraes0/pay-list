import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  _getToken(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token') ?? null;
    print(token);
    if(token == null) {
      Navigator.pushReplacementNamed(context, 'register');
      return;
    }

    Navigator.pushReplacementNamed(context, 'login');
    // return 'other';
    // tenta login
    // se sucesso = wallet screen
    // se falhar = login screen
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    this._getToken(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.width / 3.5,
                width: size.width / 3.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/launcher/logo.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50.0,
                  top: 10.0,
                ),
                child: Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  strokeWidth: 3.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
