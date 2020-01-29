import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/models/local_file.dart';
import 'package:pay_list/screens/register/register.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String localName;
  LocalFile file = new LocalFile();

  void _payDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Deleted with success!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.green,
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _deletePayments(String name) async {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['balance'] = 0.0;
    data['payments'] = [];
    await file.saveFile(jsonEncode(data));
    this._payDialog();
  }

  void _deleteAccount() {
    file.deleteFile();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Register()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = (this.localName == null) ? "Fernando" : this.localName;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        title: Text(
          'Settings',
          style: GoogleFonts.karla(
            fontSize: 21.0,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.all(20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: theme.primaryColor,
                radius: 40.0,
                child: Text(
                  name[0].toUpperCase(),
                  style: GoogleFonts.karla(
                    fontSize: 45.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karla(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  this._deletePayments(name);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                    size: 30.0,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'Delete payments.',
                    style: GoogleFonts.karla(
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: this._deleteAccount,
                child: ListTile(
                  leading: Icon(
                    Icons.delete_forever,
                    size: 30.0,
                    color: theme.primaryColor,
                  ),
                  title: Text(
                    'Delete account.',
                    style: GoogleFonts.karla(
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
