import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pay_list/components/button.dart';
import 'package:pay_list/components/input.dart';
import 'package:pay_list/models/local_file.dart';
import 'package:pay_list/screens/app/app.dart';

class Register extends StatelessWidget {
  final LocalFile _localFile = new LocalFile();
  final TextEditingController _inputController = new TextEditingController();

  Future<bool> _verifyFile(BuildContext context) async {
    dynamic file = await this._localFile.readFile();
    if (file != null) {
      return false;
    }
    return true;
  }

  Future<void> _saveOnFile(BuildContext context) async {
    String name = this._inputController.text;
    if (name.isNotEmpty) {
      Map<String, dynamic> data = {};
      data['name'] = name;
      data['balance'] = 0.0;
      data['payments'] = [];
      await this._localFile.saveFile(jsonEncode(data));
      Navigator.pushNamed(context, 'app');
    }
  }

  Widget buildRegister(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Payments Control",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Input(
                  controller: this._inputController,
                  text: 'First name',
                ),
              ),
              Button(
                text: 'Save',
                onPressed: () {
                  this._saveOnFile(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._verifyFile(context),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.data == true) {
              return this.buildRegister(context);
            }
            return AppScreen();
            break;
          default:
            return Container(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
