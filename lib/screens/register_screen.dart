import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Register',
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
                    label: 'Name',
                    icon: Icons.person,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: InputComponent(
                    controller: this._emailController,
                    keyboard: TextInputType.emailAddress,
                    label: 'Email',
                    icon: Icons.email,
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
                  onPressed: () {},
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
    );
  }
}
