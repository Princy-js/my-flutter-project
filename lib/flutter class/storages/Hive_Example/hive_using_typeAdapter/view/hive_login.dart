import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/Hive_Example/hive_using_typeAdapter/database/hive_database.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/Hive_Example/hive_using_typeAdapter/view/hive_home.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/Hive_Example/hive_using_typeAdapter/view/hive_reg.dart';

import '../model/users.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Users>('users');
  Hive.registerAdapter(UsersAdapter());
  runApp(GetMaterialApp(home: HiveLog(),));
}
class HiveLog extends StatelessWidget {

  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login'),
            SizedBox(height: 18,),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email id'
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: pwdCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password'
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
                shape: StadiumBorder(),
                color: Colors.pink,
                child: Text('Login'),
                onPressed: () async{
                  final users = await HiveDb.instance.getUsers();
                  validateLogin(users);
                }
            ),
            SizedBox(height: 15,),
            TextButton(onPressed: (){
              Get.to(HiveReg());
            }, child: Text("not a user Register here"))
          ],
        ),
      ),
    );
  }

  Future<void> validateLogin(List<Users> users) async{
    final email = emailCtrl.text.trim();
    final pwd = pwdCtrl.text.trim();
    bool userFound = false;

    if(email != '' && pwd != ''){
      await Future.forEach(users, (user) {
        if(user.email == email && user.password == pwd){
          userFound = true;
        }
        else{
          userFound = false;
        }
      });
      if(userFound == true){
        Get.offAll(()=>HiveHome(email: email));
        Get.snackbar('Success', 'Login Success',backgroundColor: Colors.green,colorText: Colors.white);
      }
      else{
        Get.snackbar('Error', 'Login Failed , No user Exists',backgroundColor: Colors.red,colorText: Colors.white);
      }
    }
    else{
      Get.snackbar('Error', 'Fields must not be empty');
    }
  }
}
