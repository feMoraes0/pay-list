import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Login',
          style: GoogleFonts.mallanna(
            fontSize: 32.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(30.0),
          color: Colors.amberAccent,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: TextField(
                  controller: this._emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.mallanna(
                      color: Colors.black87,
                      fontSize: 21.0,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: TextField(
                  controller: this._passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2.0,
                      ), 
                    ),
                    labelText: 'Password',
                    labelStyle: GoogleFonts.mallanna(
                      color: Colors.black87,
                      fontSize: 21.0,
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              FlatButton(
                padding: const EdgeInsets.all(1.0),
                color: Colors.amber[600],
                splashColor: Colors.white54,
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  alignment: Alignment.center,
                  width: size.width,
                  height: 45.0,
                  child: Text(
                    'Login',
                    style: GoogleFonts.mallanna(
                      fontSize: 21.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.30,
                      height: 2.0,
                      color: Colors.black26,
                    ),
                    Text(
                      'OR',
                      style: GoogleFonts.mallanna(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: size.width * 0.30,
                      height: 2.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              FlatButton(
                padding: const EdgeInsets.all(1.0),
                color: Colors.amber[600],
                splashColor: Colors.white54,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'register');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  alignment: Alignment.center,
                  width: size.width,
                  height: 45.0,
                  child: Text(
                    'Register',
                    style: GoogleFonts.mallanna(
                      fontSize: 21.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
