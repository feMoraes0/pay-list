import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pay_list/models/local_file.dart';
import 'package:pay_list/screens/app/tabs/home.dart';
import 'package:pay_list/screens/app/tabs/settings.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = new PageController(initialPage: 0);
  final LocalFile file = new LocalFile();
  double balance = 0.0;
  Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();

  void initState() {
    super.initState();
    this.file.readFile().then((fileData) {
      setState(() {
        this.data = jsonDecode(fileData);
        this.balance = data['balance'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: PageView(
            controller: this._pageController,
            children: <Widget>[
              Home(
                data: (data.isNotEmpty) ? this.data['payments'].reversed.toList() : null,
                balance: this.balance,
              ),
              Settings(name: this.data['name']),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 32.0,
                ),
                onPressed: () {
                  this._pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                      );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 32.0,
                ),
                onPressed: () {
                  this._pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate,
                      );
                },
              ),
            ],
          ),
          notchMargin: 5.0,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'new');
          },
          child: Icon(
            Icons.add,
            size: 32.0,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
