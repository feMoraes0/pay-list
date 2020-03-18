import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool searching = false;

  _registerUser(BuildContext context) async {
    
    String name = this._nameController.text;
    String email = this._emailController.text;
    String password = this._passwordController.text;

    if (name.trim().isEmpty) {
      TipDialogHelper.fail('Name field is required.');
      await Future.delayed(Duration(seconds: 2));
      return;
    }
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
      'https://apipayments.herokuapp.com/api/register',
      body: {'email': email, 'name': name, 'password': password},
      encoding: Encoding.getByName('JSON')
    );

    print(response.statusCode);

    Map body = json.decode(response.body);
    print(body);

    if(response.statusCode == 201) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', body['token']);
      preferences.setInt('user_id',  body['user']['id']);
      TipDialogHelper.success("Saved with success");
      await new Future.delayed(new Duration(seconds: 3));
      TipDialogHelper.dismiss();
      Navigator.pushReplacementNamed(context, 'wallet');
    } else if(response.statusCode == 505) {
      TipDialogHelper.fail("Internal server error, try again later.");
    } else if(response.statusCode == 422) {
      TipDialogHelper.fail(body['email'][0]);
    }
    await new Future.delayed(new Duration(seconds: 5));
    TipDialogHelper.dismiss();
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
              child: Text(
                'Register',
              ),
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: InputComponent(
                        controller: this._nameController,
                        keyboard: TextInputType.text,
                        label: 'Name*',
                        icon: Icons.person,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: InputComponent(
                        controller: this._emailController,
                        keyboard: TextInputType.emailAddress,
                        label: 'Email*',
                        icon: Icons.email,
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
                      onPressed: () => this._registerUser(context),
                      screenWidth: size.width,
                      label: 'Register',
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
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      screenWidth: size.width,
                      label: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        TipDialogContainer(),
      ],
    );
  }
}
