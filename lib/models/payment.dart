class Payment {
  String title, date;
  double value;

  Payment({this.title, this.date, this.value});

  Payment asObject(Map<String, dynamic> object) {
    return Payment(
      title: object['title'],
      date: object['date'],
      value: object['value'],
    );
  }

  Map<String, dynamic> asJSON() {
    Map<String, dynamic> json = {
      'title': this.title,
      'value': this.value,
      'date': this.date
    };
    return json;
  }

}
