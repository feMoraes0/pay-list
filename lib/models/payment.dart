class Payment {
  int date;
  String title;
  double value;

  Payment({
    this.title,
    this.value,
    this.date,
  });

  static Payment fromObject(Map<String, dynamic> object) {
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
