import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(home: HiveTodo(),));
}
class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String,dynamic>> task =[];///to store values from hive
  ///object creation for hive
  final mybox = Hive.box('todo_box');
  
  @override
  void initState() {
  readTask_refreshUi();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Task'),
      ),
      body:task.isEmpty
          ?Center(
                child: CircularProgressIndicator(),)
          :GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  Text(''),
                  SizedBox(height: 10,),
                  Text(''),
                  Expanded(child: Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_outlined))
                  ],))
                ],
              ),
            );
          }),
       floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
           onPressed: ()=>showAlertBox(null)),
    );
  }

  final title_cntrlr = TextEditingController();
  final description_cntrlr = TextEditingController();

 void showAlertBox(int? key) {
    //key is similar to id in sqflite

   showDialog(context: context, builder: (context){
     return AlertDialog(
       content: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           TextField(
             decoration: InputDecoration(
               hintText:'Title',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5)
               )
             ),
             controller: title_cntrlr,),
           SizedBox(height: 10,),
           TextField(
             decoration: InputDecoration(
               hintText: 'content',
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5)
                 )
             ),
             controller: description_cntrlr,),
         ],
       ),
       actions: [
         TextButton(onPressed: (){
           if(title_cntrlr.text != ''  && description_cntrlr.text != ''){
             createTask({
               'tname':title_cntrlr.text.trim(),
               'tcontent':description_cntrlr.text.trim()
             });
           }
         }, child: Text('Create Task')),
         TextButton(onPressed: (){}, child: Text('Update Task')),
         TextButton(onPressed: (){
           Navigator.pop(context);
         }, child: Text('Cancel')),
       ],
     );
   });
 }

  Future<void> createTask(Map<String, dynamic> mytask) async{
   await mybox.add(mytask);
  }

  void readTask_refreshUi() {

  }
}
