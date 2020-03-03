import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<String> cards = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.lato(
            fontSize: 26.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: this.cards.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (this.cards.length == 0 || index == this.cards.length) {
            return GestureDetector(
              onTap: () {},
              child: NewCard(
                shadow: (this.cards.length == 0) ? false : true,
              ),
            );
          }

          if (index == 0) {
            return CardDivision(
              shadow: false,
              icon: Icons.credit_card,
              label: "Fernando de Moraes",
            );
          }

          return CardDivision(
            shadow: true,
            icon: Icons.credit_card,
            label: "**** **** **** 0000",
          );
        },
      ),
    );
  }
}

class CardDivision extends StatelessWidget {
  final bool shadow;
  final IconData icon;
  final String label;

  CardDivision({
    @required this.shadow,
    @required this.icon,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 140,
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      decoration: (this.shadow)
          ? BoxDecoration(
              color: theme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  offset: Offset(0, -3),
                ),
              ],
            )
          : BoxDecoration(
              color: theme.backgroundColor,
            ),
      child: Card(icon: this.icon, label: this.label),
    );
  }
}

class Card extends StatelessWidget {
  final IconData icon;
  final String label;

  Card({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'home');
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.deepOrange,
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              this.icon,
              size: 25.0,
              color: Colors.white,
            ),
            Text(
              this.label,
              style: GoogleFonts.lato(
                fontSize: 23.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  final bool shadow;

  const NewCard({Key key, this.shadow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        boxShadow: [
          (this.shadow)
              ? BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  offset: Offset(0, -3),
                )
              : BoxShadow(
                  color: Colors.transparent,
                )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.deepOrange],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 30.0,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "ADD NEW CARD",
                  style: GoogleFonts.lato(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Cards can be for an especific\nevent or all life as credit or debit.",
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.lato(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
