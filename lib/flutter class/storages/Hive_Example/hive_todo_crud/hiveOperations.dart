import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(const MaterialApp(
    home: HiveTodo(),
  ));
}

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String, dynamic>> task = [];

  ///to store values from hive
  ///object creation for hive
  final mybox = Hive.box('todo_box');

  @override
  void initState() {
    readTask_refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
      ),
      body: task.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: task.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        task[index]['taskname'],
                        style: GoogleFonts.aBeeZee(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        task[index]['taskdes'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        '${now.hour}:${now.minute}:${now.second}',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18, top: 18),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () =>
                                    showAlertBox(task[index]['id']),
                                icon: const Icon(Icons.edit)),
                            const SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed: () => deleteTask(task[index]['id']),
                                icon: const Icon(Icons.delete_outlined))
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.task_outlined),
          onPressed: () => showAlertBox(null)),
    );
  }

  final title_cntrlr = TextEditingController();
  final description_cntrlr = TextEditingController();

  void showAlertBox(int? key) {
    //key -> task[index]['id']
    //key is similar to id in sqflite
    if (key != null) {
      final existing_task = task.firstWhere((element) => element['id'] == key);
      title_cntrlr.text = existing_task['taskname'];
      description_cntrlr.text = existing_task['taskdes'];
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  controller: title_cntrlr,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: 'content',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  controller: description_cntrlr,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title_cntrlr.text != '' &&
                        description_cntrlr.text != '') {
                      createTask({
                        'tname': title_cntrlr.text.trim(),
                        'tcontent': description_cntrlr.text.trim()
                      });
                    }
                    title_cntrlr.text = '';
                    description_cntrlr.text = '';
                    Navigator.pop(context);
                  },
                  child: const Text('Create Task')),
              TextButton(
                  onPressed: () {
                    updateTask(key, {
                      'tname': title_cntrlr.text.trim(),
                      'tcontent': description_cntrlr.text.trim()
                    });
                    title_cntrlr.text = '';
                    description_cntrlr.text = '';
                    Navigator.pop(context);
                  },
                  child: const Text('Update Task')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> mytask) async {
    await mybox.add(mytask);
    DateTime.now();
    readTask_refreshUi();

    ///refresh ui when ever we add ,delete or edit a task
  }

  void readTask_refreshUi() {
    /// boxname.keys.map((e)=>null) :it is a built in funtionality
    /// it is used to fetch the keys from hive box
    final task_from_hive = mybox.keys.map((key) {
      final value = mybox.get(key); //single map corresponding to the key
      return {
        'id': key,
        'taskname': value['tname'],
        'taskdes': value['tcontent']
      };
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

//updating the hive task of a single key
  Future<void> updateTask(int? key, Map<String, dynamic> updatedTask) async {
    await mybox.put(key, updatedTask);
    readTask_refreshUi();
    DateTime.now();
  }

  Future<void> deleteTask(int key) async {
    await mybox.delete(key);
    readTask_refreshUi();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Successfully deleted')));
  }
}
