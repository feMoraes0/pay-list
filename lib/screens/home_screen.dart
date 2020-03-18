import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_list/screens/chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool expanded;

  void initState() {
    this.expanded = false;
    super.initState();
  }

  void expand() {
    setState(() {
      expanded = !this.expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            if (!this.expanded) Navigator.pop(context);
            if(this.expanded) Navigator.pushNamed(context, 'payment_form');
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 20.0,
            ),
            child: Icon(
              (!this.expanded) ? Icons.arrow_back : Icons.add,
              size: 30.0,
              color: Colors.black,
            ),
          ),
        ),
        title: Center(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 450),
            opacity: (this.expanded) ? 1 : 0,
            child: Text(
              'Expenses',
            ),
          ),
        ),
        actions: <Widget>[
          AnimatedOpacity(
            duration: Duration(milliseconds: 450),
            opacity: (this.expanded) ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                if (this.expanded) this.expand();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.expand_more,
                  size: 32.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      top: 45.0,
                      left: 20.0,
                    ),
                    child: Text(
                      'Total Balance',
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '0.00',
                          style: GoogleFonts.lato(
                            fontSize: 40.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'payment_form');
                          },
                          child: Icon(
                            Icons.add,
                            size: 38.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 155.0,
              child: Container(
                width: size.width,
                height: 140.0,
                margin: const EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: LineChartSample2(),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(top: (this.expanded) ? 0.0 : 315.0),
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                color: (this.expanded) ? theme.backgroundColor : Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  (!this.expanded)
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Expenses',
                                style: GoogleFonts.lato(
                                  fontSize: 25.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: this.expand,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.backgroundColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: (this.expanded)
                                        ? Colors.black
                                        : Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                padding: const EdgeInsets.all(25.0),
                                margin: const EdgeInsets.only(right: 10.0),
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Title added',
                                            style: GoogleFonts.lato(
                                              fontSize: 21.0,
                                            ),
                                          ),
                                          Text(
                                            '0.00',
                                            style: GoogleFonts.lato(
                                              fontSize: 21.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Food',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            '00/00/00',
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
