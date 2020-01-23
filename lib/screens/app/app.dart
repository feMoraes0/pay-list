import "package:flutter/material.dart";

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.person_outline, size: 25.0),
                      Text("Account Balance", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),),
                      Icon(Icons.delete_outline, size: 25.0),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
