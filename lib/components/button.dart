import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        color: Colors.redAccent,
        onPressed: this.onPressed,
        child: Text(
          this.text.toUpperCase(),
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
