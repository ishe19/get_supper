import 'package:get_supper/model/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

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

  static Future<int> getCount() async {
		// Database db = await this.database;
    if (db == null) {
      await openDB();
    } else {
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from shopping_cart');
		int result = Sqflite.firstIntValue(x);
		return result;
    }
	}

  // Future<List<Product>> getTodoList() async {

	// 	var todoMapList = await getTodoMapList(); // Get 'Map List' from database
	// 	int count = todoMapList.length;         // Count the number of map entries in db table

	// 	List<Product> todoList = List<Product>();
	// 	// For loop to create a 'todo List' from a 'Map List'
	// 	for (int i = 0; i < count; i++) {
	// 		todoList.add(Product.fromMapObject(todoMapList[i]));
	// 	}

	// 	return todoList;
	// }

  static Future<List<Map<String, dynamic>>> getTodoMapList() async {
		// Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
		var result = await db.query('shopping_cart');
		return result;
	}

  static Future<List<Product>> getTodoList() async {

		var productMapList = await getList(); // Get 'Map List' from database
		int count = productMapList.length;         // Count the number of map entries in db table

		List<Product> todoList = List<Product>();
		// For loop to create a 'todo List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			todoList.add(Product.fromMapObject(productMapList[i]));
		}

		return todoList;
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
