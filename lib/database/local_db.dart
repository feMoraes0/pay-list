import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {

  Future<Database> create() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        "payments.db",
      ),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE payments(id INTEGER PRIMARY KEY AUTO_INCREMENT, title TEXT, value DOUBLE, date INTEGER)",
        );
      },
      version: 1
    );
  }

}