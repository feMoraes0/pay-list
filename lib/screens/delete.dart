import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/models/paymentDB.dart';

class DeleteScreen extends StatelessWidget {
  void delete(BuildContext context) async {
    PaymentDB db = new PaymentDB();
    await db.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0,
        title: Text(
          'Delete',
          style: GoogleFonts.karla(
            fontSize: 21.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Delete ALL payments?",
                style: GoogleFonts.karla(
                  fontSize: 22.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0,),
              child: Text(
                "Payments deleted can not be recovered later.",
                textAlign: TextAlign.center,
                style: GoogleFonts.karla(
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Close",
                    style: GoogleFonts.karla(
                      fontSize: 18.0
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    "Delete!",
                    style: GoogleFonts.karla(
                      fontSize: 18.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    this.delete(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
