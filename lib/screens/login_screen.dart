import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  _loginUser(BuildContext context) async {
    String email = this._emailController.text;
    String password = this._passwordController.text;

    if (email.trim().isEmpty) {
      TipDialogHelper.fail('Email field is required.');
      await Future.delayed(Duration(seconds: 2));
      return;
    }
    if (password.trim().isEmpty) {
      TipDialogHelper.fail('Password field is required.');
      await Future.delayed(Duration(seconds: 2));
      return;
    }

    FocusScope.of(context).unfocus();
    TipDialogHelper.loading("Loading");

    var response = await http.post(
      'https://apipayments.herokuapp.com/api/login',
      body: {'email': email, 'password': password},
    );

    int statusCode = response.statusCode;
    Map body = json.decode(response.body);

    if (statusCode == 201) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', body['token']);
      preferences.setInt('user_id', body['user']['id']);
      TipDialogHelper.success('Saved with success.');
      await new Future.delayed(new Duration(seconds: 3));
      TipDialogHelper.dismiss();
      Navigator.pushReplacementNamed(context, 'wallet');
    } else if (statusCode == 404) {
      TipDialogHelper.fail('User not found.');
      await new Future.delayed(new Duration(seconds: 3));
      TipDialogHelper.dismiss();
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Center(
              child: Text('Login'),
            ),
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
                      label: 'Email*',
                      icon: Icons.person,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25.0),
                    child: InputComponent(
                      controller: this._passwordController,
                      keyboard: TextInputType.visiblePassword,
                      label: 'Password*',
                      icon: Icons.vpn_key,
                    ),
                  ),
                  ButtonComponent(
                    onPressed: () => this._loginUser(context),
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
        ),
        TipDialogContainer(),
      ],
    );
  }
}
