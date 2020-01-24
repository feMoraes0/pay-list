import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:pay_list/components/credit_card.dart';
import 'package:pay_list/components/pay_list.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  
  Widget buildCardOption(IconData icon, String text, ThemeData theme) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(360.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0.0, 4.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        size: 25.0,
                      ),
                      Text(
                        "Account Balance",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.delete_outline,
                        size: 25.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: size.width * 0.05,
                  ),
                  child: CreditCard(
                    username: "Fernando",
                    total: "480.86",
                    date: "00/00",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Hero(
                      tag: "new",
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "new");
                        },
                        child: this.buildCardOption(Icons.add, "Add", theme),
                      ),
                    ),
                    this.buildCardOption(Icons.visibility_off, "Hide", theme),
                    this.buildCardOption(Icons.delete_outline, "Clear", theme),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: PayList(),
            ),
          ],
        ),
      ),
    );
  }
}
