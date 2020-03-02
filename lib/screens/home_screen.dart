import 'package:flutter/material.dart';
import 'package:pay_list/screens/chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double containerMarginTop = 315.0;

  void updateMarginTop() {
    setState(() {
      containerMarginTop = (containerMarginTop == 315.0) ? 0.0 : 315.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 45.0,
                      left: 20.0,
                    ),
                    child: Text(
                      'Total Balance',
                      style: TextStyle(
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
                          '0000.00',
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 38.0,
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
                child: LineChartSample2()
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.only(top: this.containerMarginTop),
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Expenses',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: this.updateMarginTop,
                        child: Icon(
                          (this.containerMarginTop == 310.0)
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text('1'),
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
