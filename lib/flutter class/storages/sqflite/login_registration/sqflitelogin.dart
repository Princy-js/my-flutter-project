import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/home.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/login_registration.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sqflite_registration.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sql_functions_LR_db.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({super.key});

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  var formkey_2 = GlobalKey<FormState>();
  var email_con = TextEditingController();
  var pass_con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void checkLogin(String email, String password) async {
      final data = await Sql_operations.LoginCheck(email, password);

      if (data.isNotEmpty) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePageSQL(datas: data,)));
      }
      else if (data.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>Login_Signup()));
        print('Login faild');
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Form(
          key: formkey_2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 30),
                  child: Text(
                    'Login Page',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: email_con,
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@') ||
                          !email.contains('.')) {
                        return 'Enter a valid email';
                      }
                      else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: pass_con,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (pswd) {
                      if (pswd!.isEmpty || pswd.length < 6) {
                        return 'Password should contain atleast 6 Characters';
                      }
                      else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.purple),
                        minimumSize: MaterialStateProperty.all(const Size(260, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                    onPressed: () {
                      final valid = formkey_2.currentState!.validate();
                      if (valid) {
                        checkLogin(email_con.text, pass_con.text);
                      } else {}
                    },
                    child: const Text("LOGIN"),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => Registration_Form()));
                    },
                    child: const Text('Not a User? Register Here!'))
              ],
            ),
          )),
    );
  }
}
