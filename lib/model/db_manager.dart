import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBManagerViews {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'cart.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table shopping_cart(
            id integer primary key autoincrement,
            title text not null,         
            price text not null,
            img text not null
          );''');
    });
  }

  static Future insertOrder(Map<String, dynamic> note) async {
    try {
      await db.insert('shopping_cart', note);
      print("Data inserted");
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Map<String, dynamic>>>getList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('shopping_cart');
    }
  }

  static Future deleteOrder(int id) async {
    await db.delete('shopping_cart', where: 'id = ?', whereArgs: [id]);
  }

}
