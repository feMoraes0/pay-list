import "package:flutter/material.dart";

class FlexibleSpace extends StatelessWidget {
  final double parentHeight;
  final double parentWidth;

  FlexibleSpace({@required this.parentHeight, @required this.parentWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.parentHeight,
      width: this.parentWidth,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Total Balance", style: TextStyle(fontSize: 16.0),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text("8000.00", style: TextStyle(fontSize: 35.0),),
          ),
        ],
      ),
    );
  }
}
