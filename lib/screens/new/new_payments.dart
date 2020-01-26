import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pay_list/components/input.dart';
import 'package:pay_list/models/local_file.dart';
import 'package:pay_list/models/payment.dart';

class NewPayments extends StatefulWidget {
  @override
  _NewPaymentsState createState() => _NewPaymentsState();
}

class _NewPaymentsState extends State<NewPayments> {
  final LocalFile file = new LocalFile();
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _valueController = new TextEditingController();

  void saveData() {
    String title = this._titleController.text;
    String value = this._valueController.text;
    if (title == "" || value == "") return;

    Payment payment = new Payment(
      title: title,
      value: double.parse(value),
      date: DateFormat('d.M.y').format(DateTime.now()),
    );

    file.readFile().then((data) async {
      Map fileData = jsonDecode(data);
      fileData['balance'] += payment.value;
      fileData['payments'].add(payment.asJSON());
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.save,
          size: 24.0,
          color: Colors.white,
        ),
        label: Text(
          'SAVE',
          style: GoogleFonts.karla(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: this.saveData,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
