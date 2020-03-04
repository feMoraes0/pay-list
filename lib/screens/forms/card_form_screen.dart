import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class CardFormScreen extends StatefulWidget {
  @override
  _CardFormScreenState createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  TextEditingController _emailController = new TextEditingController();
  
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'Android',
        Icon(
          Icons.android,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'Flutter',
        Icon(
          Icons.flag,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'ReactNative',
        Icon(
          Icons.format_indent_decrease,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'iOS',
        Icon(
          Icons.mobile_screen_share,
          color: const Color(0xFF167F67),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'New Card',
          style: GoogleFonts.lato(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: DirectSelectContainer(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.amberAccent,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: InputComponent(
                    controller: this._emailController,
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
      ),
    );
  }
}
