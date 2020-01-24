import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class PayList extends StatefulWidget {
  @override
  _PayListState createState() => _PayListState();
}

class _PayListState extends State<PayList> {
  final List<String> itens = [
    "teste 01",
    "teste 02",
    "teste 03",
    "teste 04",
    "teste 05",
    "teste 06",
    "teste 07",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
    "teste 08",
  ];
  GlobalKey listKey = new GlobalKey();
  double containerHeight = 435.0;
  double limitValue = 580.0;
  double minValue = 435.0;
  ScrollPhysics _physics = AlwaysScrollableScrollPhysics();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: size.width,
      height: this.containerHeight,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, -5.0),
            blurRadius: 2.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          ScrollDirection direction =
              this._scrollController.position.userScrollDirection;
          double scroll = scrollNotification.metrics.pixels;
          if (direction == ScrollDirection.reverse) {
            double futurePosition = scroll + this.containerHeight;
            if (futurePosition < this.limitValue) {
              setState(() {
                this.containerHeight = this.limitValue;
              });
            }
          } else if (direction == ScrollDirection.forward && scroll == 0.0) {
            setState(() {
              this.containerHeight = this.minValue;
            });
          }
          return true;
        },
        child: ListView.builder(
          key: this.listKey,
          controller: this._scrollController,
          physics: this._physics,
          itemCount: this.itens.length,
          itemBuilder: (context, position) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(this.itens[position]),
            );
          },
        ),
      ),
    );
  }
}
