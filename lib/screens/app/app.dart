import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/flexible_space.dart';
import 'package:pay_list/models/local_file.dart';

int getPrecision(double value) {
  int precision = 4;

  if (value < 10) {
    precision = 3;
  } else if (value >= 100 && value < 1000) {
    precision = 5;
  } else if (value >= 1000) {
    precision = 6;
  }

  return precision;
}

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  LocalFile _localFile = new LocalFile();
  ScrollController _scrollController = ScrollController();
  double _opacity = 1;
  String _balance = "0";
  List<dynamic> _payments = new List();

  @override
  void initState() {
    this._scrollController.addListener(updateOpacity);
    this._localFile.readFile().then(
      (fileData) {
        setState(() {
          this._payments = jsonDecode(fileData)["payments"];
          double balance = jsonDecode(fileData)["balance"];
          this._balance = balance.toStringAsPrecision(getPrecision(balance));
        });
      }
    );
    super.initState();
  }

  void updateOpacity() {
    print(this._scrollController.offset.toString());
    double offset = this._scrollController.offset;
    if (offset <= 82) {
      setState(() {
        _opacity = 1 - (offset / 82);
      });
    }
  }

  Widget _renderNoItem(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: screenSize.height - 205,
      child: Center(
        child: Text(
          'No data.',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }

  Widget _renderItem(int index) {
    Map<String, dynamic> item = this._payments[index];
    int precision = getPrecision(item['value']);
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          item['title'][0].toString().toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(
        '${item['title']}',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        '${item['date']}',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      trailing: Text(
        item['value'].toStringAsPrecision(precision),
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    print("rendering app");

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          controller: this._scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: theme.primaryColor,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 650),
                      opacity: (this._opacity < 0.1) ? 1 : 0,
                      child: Text(
                        "Balance: " + this._balance,
                        style: GoogleFonts.karla(fontSize: 22.0,),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, size: 27.0,),
                      onPressed: () =>
                          Navigator.of(context).pushNamed("settings"),
                    ),
                  ],
                ),
              ),
              pinned: true,
              expandedHeight: 180,
              flexibleSpace: Opacity(
                opacity: this._opacity,
                child: FlexibleSpace(
                  parentHeight: 180,
                  parentWidth: size.width,
                  balance: this._balance,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if(this._payments.length == 0) {
                    return this._renderNoItem(size);
                  } else if(index < this._payments.length) {
                    return this._renderItem(index);
                  }
                  return Container();
                },
                childCount: this._payments.length + 1,
              ),
            ),
          ],
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
          Icons.add,
          size: 24.0,
          color: Colors.white,
        ),
        label: Text(
          "NEW",
          style: GoogleFonts.karla(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("new");
        },
      ),
    );
  }
}
