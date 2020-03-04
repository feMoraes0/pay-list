import 'package:flutter/material.dart';
import 'package:pay_list/components/button_component.dart';
import 'package:pay_list/components/input_component.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class PaymentsFormScreen extends StatefulWidget {
  @override
  _PaymentsFormScreenState createState() => _PaymentsFormScreenState();
}

class _PaymentsFormScreenState extends State<PaymentsFormScreen> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _valueController = new TextEditingController();

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
        title: Text(
          'New Payment',
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
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: InputComponent(
                  controller: this._valueController,
                  keyboard: TextInputType.numberWithOptions(decimal: true),
                  label: 'Value',
                  icon: Icons.attach_money,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 25.0,
                ),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.black87,
                    width: 2.0,
                  ),
                ),
                child: DropdownButton<Item>(
                  itemHeight: 60.0,
                  underline: Container(),
                  hint: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          Icons.category,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                  value: selectedUser,
                  onChanged: (Item value) {
                    setState(() {
                      selectedUser = value;
                    });
                  },
                  items: users.map((Item user) {
                    return DropdownMenuItem<Item>(
                      value: user,
                      child: Container(
                        width: size.width - 90.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            user.icon,
                            Text(
                              user.name,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
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
