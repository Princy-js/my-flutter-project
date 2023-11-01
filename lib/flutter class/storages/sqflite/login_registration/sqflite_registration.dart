import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sqflitelogin.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sql_functions_LR_db.dart';

class Registration_Form extends StatelessWidget {
  var formkey_1 = GlobalKey<FormState>();
  var name_con = TextEditingController();
  var email_con = TextEditingController();
  var pass_con = TextEditingController();
  var cpass_con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void Addnewuser(String name, String email, String password) async {
      var id = await Sql_operations.AddnewUser(name, email, password);
      if (id != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => Login_Form()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:
            Text('Registration not Successful')));
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formkey_1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0,bottom: 30),
                  child: Text(
                    'Register Here!',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: name_con,
                    validator: (name){
                      if(name!.isEmpty){
                        return 'Name is required';
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: email_con,
                    validator: (email){
                      if(email!.isEmpty || !email.contains('@') || !email.contains('.')){
                        return 'Enter a valid email';
                      }
                      else{
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
                    validator: (pswd){
                      if(pswd!.isEmpty || pswd.length<6){
                        return 'Password should contain atleast 6 Characters';
                      }
                      else{
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
                  child: TextFormField(
                    controller: cpass_con,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (pswd){
                      if(pswd!.isEmpty){
                        return 'Password should be greater than 6';
                      }
                      else if(pass_con.text != cpass_con.text){
                        return 'Password not matched';
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_person),
                        labelText: 'ConfirmPassword',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        minimumSize: MaterialStateProperty.all(const Size(330, 50)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                    onPressed: () async{
                      final valid = formkey_1.currentState!.validate();
                      if(valid){
                        Addnewuser(name_con.text,email_con.text,pass_con.text);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                            content: const Text('Invalid username / password')));
                      }
                    }, child: Text('Sign Up')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Login_Form()));
                    },
                    child: Text("Already have an existing account? Login"),
                )
              ],
            )),
      ),
    );
  }
}


