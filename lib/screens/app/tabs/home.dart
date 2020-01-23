import 'package:flutter/material.dart';

int getPrecision(double value) {
  int precision = 4;
  
  if(value < 10) {
    precision = 3;
  } else if(value >= 100 && value < 1000) {
    precision = 5;
  } else if(value >= 1000) {
    precision = 6;
  }

  return precision;
}

class Home extends StatelessWidget {
  final List<dynamic> data;
  final double balance;

  const Home({@required this.data, @required this.balance});

  Widget _renderList() {
    return (this.balance != 0.0) ? ListView.builder(
      itemCount: this.data.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> item = this.data[index];
        int precision = getPrecision(item['value']);
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              item['title'][0].toString().toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          title: Text(
            '${item['title']}',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            '${item['date']}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          trailing: Text(
            item['value'].toStringAsPrecision(precision),
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        );
      },
    ) : Center(
      child: Text('No data.', style: TextStyle(fontSize: 30.0, color: Colors.grey[300],),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Balance",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Text(
            this.balance.toStringAsPrecision(getPrecision(this.balance)),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
          Divider(),
          Expanded(
            child: this._renderList(),
          ),
        ],
      ),
    );
  }
}
