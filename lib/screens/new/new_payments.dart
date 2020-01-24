import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_list/components/input.dart';
import 'package:pay_list/models/local_file.dart';

class NewPayments extends StatefulWidget {
  @override
  _NewPaymentsState createState() => _NewPaymentsState();
}

class _NewPaymentsState extends State<NewPayments> {
  final LocalFile file = LocalFile();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  bool send = true;

  void saveData() {
    String title = this._titleController.text;
    String value = this._valueController.text;
    if (title == "" || value == "") return;

    Map<String, dynamic> localData = Map<String, dynamic>();
    localData['title'] = title;
    localData['value'] = double.parse(value);
    localData['date'] = DateFormat('d.M.y').format(DateTime.now());

    file.readFile().then((data) async {
      Map fileData = jsonDecode(data);
      fileData['balance'] += localData['value'];
      fileData['payments'].add(localData);
      await file.saveFile(jsonEncode(fileData));
      this._titleController.text = "";
      this._valueController.text = "";
      Navigator.pushNamed(context, "app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "new",
        child: Material(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'New Payment',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        InkResponse(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(Icons.close, size: 28.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Input(
                      controller: this._titleController,
                      text: 'Title',
                      keyboard: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Input(
                      controller: this._valueController,
                      text: 'Value',
                      keyboard: TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.save,
          size: 24.0,
          color: Colors.white,
        ),
        label: Text(
          'SAVE',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: this.saveData,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
