import 'package:sqflite/sqflite.dart'as sql;

class Sql_operations{
  //create database
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('userdetails', version: 1,
        onCreate: (sql.Database db, int version) async {
          await createTable(db);
        });
  }
  //create Table
  static Future<void> createTable(sql.Database db) async {
    await db.execute("""CREATE TABLE user(
       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       name TEXT,
       email TEXT,
       password TEXT
      )""");
  }
//create new user
  static Future<int> AddnewUser(String name, String email, String password) async {
    final db = await Sql_operations.OpenDb();
    final data = {'name': name, 'email': email, 'password': password};
    final id = db.insert('user', data);
    return id;
  }
  

}