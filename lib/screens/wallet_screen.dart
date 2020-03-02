import "package:flutter/material.dart";

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  var cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView.builder(
        itemCount: this.cards.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (this.cards.length == 0 || index == this.cards.length + 1) {
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
              icon: Icons.person_outline,
              label: "Fernando de Moraes",
            );
          }

          return CardDivision(
            shadow: true,
            icon: Icons.account_balance_wallet,
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
    return Container(
      height: 140,
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      decoration: (this.shadow)
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  offset: Offset(0, -3),
                ),
              ],
            )
          : BoxDecoration(
              color: Colors.white,
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
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blueAccent,
            Colors.lightBlueAccent,
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
            color: Theme.of(context).backgroundColor,
          ),
          Text(
            this.label,
            style: TextStyle(
              fontSize: 23.0,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ],
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
            colors: [
              Colors.orange,
              Colors.redAccent,
            ],
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
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Cards can be for an especific\nevent or all life as credit or debit",
                  maxLines: 5,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16.0,
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
