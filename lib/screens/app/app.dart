import "package:flutter/material.dart";

class AppScreen extends StatelessWidget {
  Widget buildCard(Size size, ThemeData theme) {
    return Container(
      width: size.width * 0.90,
      height: size.width * 0.45,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3.0, 3.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "PayControl",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "500.00",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "FERNANDO",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "00/00",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

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
                offset: Offset(3.0, 3.0),
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
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        )
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
                  child: this.buildCard(size, theme),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    this.buildCardOption(Icons.add, "Add", theme),
                    this.buildCardOption(Icons.visibility_off, "Hide", theme),
                    this.buildCardOption(Icons.delete_outline, "Clear", theme),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
