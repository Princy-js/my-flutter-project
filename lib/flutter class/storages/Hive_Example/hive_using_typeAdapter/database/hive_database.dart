import 'package:hive/hive.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/Hive_Example/hive_using_typeAdapter/model/users.dart';

class HiveDb{
  ///factory keyword use cheyth oru class nu single object mathram create cheyunnapole aakam
  ///singleton class (created using factory constructor,it have only single instance
  ///factory constructor return this instance

  HiveDb._intern(); //named constructor
  static HiveDb instance = HiveDb._intern();//object creation

  //factory constructor
  factory HiveDb(){
    return instance;
  }

 Future<List<Users>> getUsers() async{
    final db = await Hive.openBox<Users>('users');
    return db.values.toList();
 }

  Future<void> addUser(Users user) async{
    final db = await Hive.openBox<Users>('users');
    db.put(user.id, user); // add email name and password to hive
  }
}