import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
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
    if (offset <= 200) {
      setState(() {
        _opacity = 1 - (offset / 200);
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
      appBar: AppBar(
        elevation: 0.0,
        title: Opacity(
          opacity: 1 - this._opacity,
          child: Text("Balance: 8000.00"),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_balance_wallet),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: this._scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: theme.primaryColor,
              pinned: false,
              floating: false,
              primary: true,
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
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 1000,
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   ThemeData theme = Theme.of(context);

  //   return Scaffold(
  //     body: SafeArea(
  //       child: Stack(
  //         children: <Widget>[
  //           Column(
  //             children: <Widget>[
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   vertical: 10.0,
  //                   horizontal: 12.0,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Icon(
  //                       Icons.person_outline,
  //                       size: 25.0,
  //                     ),
  //                     Text(
  //                       "Account Balance",
  //                       style: TextStyle(
  //                         fontSize: 20.0,
  //                         fontWeight: FontWeight.w700,
  //                       ),
  //                     ),
  //                     Icon(
  //                       Icons.delete_outline,
  //                       size: 25.0,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(
  //                   vertical: 20.0,
  //                   horizontal: size.width * 0.05,
  //                 ),
  //                 child: CreditCard(
  //                   username: "Fernando",
  //                   total: "480.86",
  //                   date: "00/00",
  //                 ),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   Hero(
  //                     tag: "new",
  //                     child: GestureDetector(
  //                       onTap: () {
  //                         Navigator.pushNamed(context, "new");
  //                       },
  //                       child: this.buildCardOption(Icons.add, theme),
  //                     ),
  //                   ),
  //                   this.buildCardOption(Icons.visibility_off, theme),
  //                   this.buildCardOption(Icons.delete_outline, theme),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             child: PayList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
