import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
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
                    image: AssetImage('assets/launcher/logo.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0, top: 10.0),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
