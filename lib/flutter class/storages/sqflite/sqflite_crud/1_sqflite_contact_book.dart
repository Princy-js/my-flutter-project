import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/sqflite_crud/sql_functions_db.dart';

void main() {
  runApp(const MaterialApp(
    home: ContactBook(),
  ));
}

class ContactBook extends StatefulWidget {
  const ContactBook({super.key});

  @override
  State<ContactBook> createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  List<Map<String, dynamic>> contacts = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: isLoading
          ? Text(
              'Add new contact',
              style: GoogleFonts.adamina(fontSize: 20),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        child: const Icon(Icons.person),
                        backgroundColor:
                            Colors.primaries[index % Colors.primaries.length],
                      ),
                      title: Text(contacts[index]['cname']),
                      subtitle: Text(contacts[index]['cnumber']),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () => showsheet(contacts[index]['id']), icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () =>deleteContact(contacts[index]['id']), icon: const Icon(Icons.delete))
                        ],
                      )),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showsheet(null),
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }

  final name_cntlr = TextEditingController();
  final num_cntlr = TextEditingController();

  void showsheet(int? id) {
    if(id != null){
      final existingdata = contacts.firstWhere((element) => element['id'] == id);
      name_cntlr.text = existingdata['cname'];
      num_cntlr.text = existingdata['cnumber'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_cntlr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: num_cntlr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Phone number'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      if(id == null){
                        createContact(name_cntlr.text,num_cntlr.text);
                      }
                      if(id != null){
                         updateContact(id);
                      }
                      /// to clear text fields
                      name_cntlr.text = '';
                      num_cntlr.text ='';
                      Navigator.of(context).pop();
                    },
                    child:
                        Text(id == null ? "create contact" : "update contact"))
              ],
            ),
          );
        });
  }

 Future<void > createContact(String name, String number) async{
    ///addnewContact is a static method (className . method)
    await Sql_Functions.addnewContact(name,number);
    readContact_and_refreshUi();
  }
  @override
  void initState() {
   readContact_and_refreshUi();
    super.initState();
  }

  Future<void> readContact_and_refreshUi() async{
    final mycontacts = await Sql_Functions.readContacts();
    setState(() {
      contacts = mycontacts;
      isLoading = false;
    });
  }
//updateContact() :created by main page
  //updateContactt() : it is database function both are not same
  Future<void> updateContact(int id) async{
    await Sql_Functions.updateContactt(id,name_cntlr.text,num_cntlr.text);
    readContact_and_refreshUi();// to update the list
  }

  Future<void>deleteContact(int id) async{
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: Text('Delete contact?'),
      content: Text('Do you want to Delete this contact!!'),
      actions: <Widget>[
        TextButton(onPressed: () async{
          await Sql_Functions.removeContact(id);
          readContact_and_refreshUi();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Deleted')));
          Navigator.pop(context);
        },
            child: Text('Yes')),
        TextButton(onPressed: () async{

        }, child: Text('No'))
      ],
    ));
  }
}
