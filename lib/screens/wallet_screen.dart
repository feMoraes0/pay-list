import 'package:flutter/material.dart';
import 'package:pay_list/components/card_component.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<String> cards = ['', ''];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Wallet',
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.exit_to_app,
                size: 28.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: this.cards.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (this.cards.length == 0 || index == this.cards.length) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'card_form');
              },
              child: CardComponent(
                shadow: true,
                icon: Icons.credit_card,
                label: 'ADD NEW CARD',
                description:
                    'Cards can be for an especific\nevent or all life as credit or debit.',
                fullCard: true,
              ),
            );
          }

          if (index == 0) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'home');
              },
              child: CardComponent(
                shadow: false,
                icon: Icons.delete_outline,
                label: 'Fernando de Moraes',
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
            child: CardComponent(
              shadow: true,
              icon: Icons.delete_outline,
              label: '**** **** **** 0000',
            ),
          );
        },
      ),
    );
  }
}
