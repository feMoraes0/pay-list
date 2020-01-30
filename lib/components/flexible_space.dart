import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlexibleSpace extends StatelessWidget {
  final double parentHeight;
  final double parentWidth;
  final String balance;

  FlexibleSpace({
    @required this.parentHeight,
    @required this.parentWidth,
    @required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.parentHeight,
      width: this.parentWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Total Balance',
            style: GoogleFonts.karla(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.balance,
                  style: GoogleFonts.karla(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.file_upload,
                  size: 27.0,
                  color: Colors.transparent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
