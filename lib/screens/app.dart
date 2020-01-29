import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/custom_scroll.dart';
import 'package:pay_list/models/local_file.dart';

class AppScreen extends StatelessWidget {
  Future<dynamic> getFileData() async {
    LocalFile _localFile = new LocalFile();
    return await _localFile.readFile().then((fileData) {
      return jsonDecode(fileData);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          future: getFileData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null)
                return CustomScroll(
                  payments: snapshot.data["payments"],
                  balance: snapshot.data["balance"].toString(),
                );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.add,
          size: 24.0,
          color: Colors.white,
        ),
        label: Text(
          "NEW",
          style: GoogleFonts.karla(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("new");
        },
      ),
    );
  }
}
