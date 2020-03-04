import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';

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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(30.0),
          color: theme.backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: InputComponent(
                  controller: this._emailController,
                  keyboard: TextInputType.emailAddress,
                  label: 'Email',
                  icon: Icons.person,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: InputComponent(
                  controller: this._passwordController,
                  keyboard: TextInputType.visiblePassword,
                  label: 'Password',
                  icon: Icons.vpn_key,
                ),
              ),
              ButtonComponent(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'wallet');
                },
                screenWidth: size.width,
                label: 'Login',
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
                      style: GoogleFonts.lato(
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
              ButtonComponent(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'register');
                },
                screenWidth: size.width,
                label: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
