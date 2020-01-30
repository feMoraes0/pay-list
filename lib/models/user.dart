import 'package:pay_list/models/payment.dart';

class User {
  String name;
  double balance;
  List<Payment> payments = List<Payment>();

  User({
    this.name,
    this.balance,
    this.payments,
  });

  static User fromJSON(Map<String, dynamic> object) {
    List<Payment> payments = [];

    for (Map<String, dynamic> element in object['payments'])
      payments.add(Payment.fromObject(element));

    return User(
      name: object['name'],
      balance: object['balance'],
      payments: payments,
    );
  }

  Map<String, dynamic> asJSON() {
    return {
      'name': this.name,
      'balance': this.balance,
      'payments': this.payments,
    };
  }
}
