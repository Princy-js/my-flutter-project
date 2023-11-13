import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.openBox('tasks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hive Task Example'),
        ),
        body: TaskScreen(),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  void _performTask(String task) {
    Box tasksBox = Hive.box('tasks');
    tasksBox.put('lastTask', task);
    tasksBox.put('lastTaskTimestamp', DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _performTask('Create Task');
            },
            child: Text('Create Task'),
          ),
          ElevatedButton(
            onPressed: () {
              _performTask('Update Task');
            },
            child: Text('Update Task'),
          ),
          ElevatedButton(
            onPressed: () {
              _performTask('Delete Task');
            },
            child: Text('Delete Task'),
          ),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: Hive.box('tasks').listenable(),
            builder: (context, Box box, widget) {
              String lastTask = box.get('lastTask', defaultValue: 'No task performed');
              String lastTaskTimestamp = box.get('lastTaskTimestamp', defaultValue: '');
              return Column(
                children: [
                  Text(
                    'Last Task: $lastTask',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Last Task Timestamp: $lastTaskTimestamp',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
