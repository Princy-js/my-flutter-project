import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/Hive_Example/hive_using_typeAdapter/model/users.dart';

import '../database/hive_database.dart';

class HiveReg extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration'),
            SizedBox(height: 18,),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'user name'
              ),
            ),
            SizedBox(height: 15,),
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
            SizedBox(height: 15,),
            MaterialButton(
                shape: StadiumBorder(),
                color: Colors.pink,
                child: Text('Register'),
                onPressed: () async{
                  final userlist = await HiveDb.instance.getUsers();
                  validateSignup(userlist);
                  nameCtrl.clear();
                  emailCtrl.clear();
                  pwdCtrl.clear();
                }
            )
          ],
        ),
      ),
    );
  }
  void validateSignup(List<Users> userList) async {
    final name = nameCtrl.text.trim();
    final mail = emailCtrl.text.trim();
    final pswrd = pwdCtrl.text.trim();

    final validateEmail = EmailValidator.validate(mail);
    final validatePassword = checkPassword(pswrd);

    if (name.isNotEmpty && mail.isNotEmpty && pswrd.isNotEmpty) {
      if (validateEmail) {
        if (validatePassword) {
          bool userExists = userList.any((user) => user.email == mail);

          if (userExists) {
            Get.snackbar("Error!", "User Already Exists!");
          } else {
            final user = Users(email: mail, password: pswrd, name: name);
            await HiveDb.instance.addUser(user);
            Get.back(); // Navigate to login
            Get.snackbar('Success', 'User Registration Success!');
          }
        }
      } else {
        Get.snackbar("Error", "Enter a valid email!");
      }
    } else {
      Get.snackbar("Error", "Please fill in all the fields");
    }
  }

  bool checkPassword(String pswrd) {
    if (pswrd.length < 6) {
      Get.snackbar("Error", "Password length must be > 6");
      return false;
    } else {
      return true;
    }
  }
}
