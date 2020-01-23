import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pay_list/models/local_file.dart';

class Settings extends StatefulWidget {
  final String name;

  Settings({@required this.name});

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
            title: Text('Deleted with success!', textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0, color: Colors.green,),),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'app');
                },
                child: Text('Ok!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0,),),
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
    Navigator.popAndPushNamed(context, 'register');
  }

  @override
  Widget build(BuildContext context) {
    String name = (this.localName == null) ? widget.name : this.localName;
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 40.0,
            child: Text(
              name[0].toUpperCase(),
              style: TextStyle(
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
              style: TextStyle(
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
                Icons.delete_sweep,
                size: 30.0,
                color: primaryColor,
              ),
              title: Text(
                'Delete payments.',
                style: TextStyle(
                  fontSize: 19.0,
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
                color: primaryColor,
              ),
              title: Text(
                'Delete account.',
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
