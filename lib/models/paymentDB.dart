
import 'package:pay_list/database/local_db.dart';
import 'package:pay_list/models/payment.dart';
import 'package:sqflite/sqflite.dart';

class PaymentDB {
  
  Future<int> create(Payment payment) async {
    final Database db = await LocalDB.create();
    return await db.insert(
      "payments",
      payment.asJSON(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  // void read() {}
  // void update() {}
  // void delete() {}

  Future<double> readBalance() async {
    final Database db = await LocalDB.create();
    List<Map> dbAnswer = await db.rawQuery("SELECT SUM(value) FROM payments");
    return dbAnswer[0]["SUM(value)"];
  }

  Future<List<Map>> readAll() async {
    final Database db = await LocalDB.create();
    return await db.query('payments');
  }

}