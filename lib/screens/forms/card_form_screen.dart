import 'package:flutter/material.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';

class CardFormScreen extends StatefulWidget {
  @override
  _CardFormScreenState createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  TextEditingController _titleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            'New Card',
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: InputComponent(
                  controller: this._titleController,
                  keyboard: TextInputType.text,
                  label: 'Title',
                  icon: Icons.text_fields,
                ),
              ),
              ButtonComponent(
                onPressed: () {},
                screenWidth: size.width,
                label: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
