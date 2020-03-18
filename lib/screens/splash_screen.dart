import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  _verifyToken(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    int userId = preferences.getInt('user_id');
    if(token == null || userId == null) {
      Navigator.pushReplacementNamed(context, 'login');
      return;
    }
    Navigator.pushReplacementNamed(context, 'wallet');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    this._verifyToken(context);

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
