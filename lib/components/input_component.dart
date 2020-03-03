import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputComponent extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const InputComponent({
    Key key,
    @required this.controller,
    @required this.label,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
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
