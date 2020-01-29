import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType keyboard;

  Input({
    Key key,
    @required this.controller,
    @required this.text,
    this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness theme = Theme.of(context).brightness;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: (theme == Brightness.dark) ? Colors.grey[600] : Colors.grey[300],
      ),
      child: TextField(
        controller: this.controller,
        keyboardType: (keyboard == null) ? TextInputType.text : keyboard,
        autocorrect: false,
        style: GoogleFonts.karla(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          hintText: this.text,
          hintStyle: GoogleFonts.karla(
            fontSize: 20.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
