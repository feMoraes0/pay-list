import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  final Function onPressed;
  final double screenWidth;
  final String label;

  const ButtonComponent({
    Key key,
    @required this.onPressed,
    @required this.screenWidth,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(1.0),
      color: Colors.amber[600],
      splashColor: Colors.white54,
      onPressed: this.onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        width: this.screenWidth,
        height: 45.0,
        child: Text(
          this.label,
          style: GoogleFonts.lato(
            fontSize: 19.0,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
