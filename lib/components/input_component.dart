import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputComponent extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final String label;
  final IconData icon;

  const InputComponent({
    Key key,
    @required this.controller,
    @required this.keyboard,
    @required this.label,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      keyboardType: this.keyboard,
      obscureText: (keyboard == TextInputType.visiblePassword) ? true : false,
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
        labelText: this.label,
        labelStyle: GoogleFonts.lato(
          color: Colors.black87,
          fontSize: 19.0,
        ),
        prefixIcon: Icon(
          this.icon,
          color: Colors.black87,
        ),
      ),
    );
  }
}
