import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardComponent extends StatelessWidget {
  final bool shadow;
  final IconData icon;
  final String label, description;
  final bool fullCard;

  CardComponent({
    @required this.shadow,
    @required this.icon,
    @required this.label,
    this.fullCard = false,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: (this.fullCard) ? 220 : 140,
      padding: EdgeInsets.fromLTRB(
        20.0,
        20.0,
        20.0,
        (this.fullCard) ? 20.0 : 0.0,
      ),
      decoration: (this.shadow)
          ? BoxDecoration(
              color: theme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  offset: Offset(0, -3),
                ),
              ],
            )
          : BoxDecoration(
              color: theme.backgroundColor,
            ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          20.0,
          20.0,
          20.0,
          (this.fullCard) ? 20.0 : 0.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.deepOrange,
            ],
          ),
          borderRadius: (this.fullCard)
              ? BorderRadius.circular(10.0)
              : BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              this.icon,
              size: 25.0,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  this.label,
                  style: GoogleFonts.lato(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                (this.fullCard) ? Text(
                  this.description,
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.lato(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
