import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/components/card_component.dart';

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
              onTap: () {
                Navigator.pushNamed(context, 'card_form');
              },
              child: CardComponent(
                shadow: true,
                icon: Icons.add,
                label: 'ADD NEW CARD',
                description: 'Cards can be for an especific\nevent or all life as credit or debit.',
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
                icon: Icons.credit_card,
                label: "Fernando de Moraes",
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
            child: CardComponent(
              shadow: true,
              icon: Icons.credit_card,
              label: "**** **** **** 0000",
            ),
          );
        },
      ),
    );
  }
}