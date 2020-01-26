import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/flexible_space.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  ScrollController _scrollController = ScrollController();
  double _opacity = 1;

  @override
  void initState() {
    this._scrollController.addListener(updateOpacity);
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

  Widget buildCardOption(IconData icon, ThemeData theme) {
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
      backgroundColor: theme.primaryColor,
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
                      opacity: (this._opacity < 0.1)? 1 : 0,
                      child: Text(
                        "Balance: 8000.00",
                        style: GoogleFonts.karla(fontSize: 22.0),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, size: 27.0),
                      onPressed: () {},
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
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0 * this._opacity),
                          topRight: Radius.circular(20.0 * this._opacity),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Item #$index', style: TextStyle(color: Colors.black),),
                      ),
                    );
                  } else {
                    return Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Item #$index', style: TextStyle(color: Colors.black),),
                      ),
                    );
                  }
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("new"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0),),),
        backgroundColor: theme.primaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 30.0,),
      ),
    );
  }
}
