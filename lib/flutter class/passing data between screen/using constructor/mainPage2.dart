import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/passing%20data%20between%20screen/using%20constructor/toStateful.dart';
import 'package:new_flutter_project_class/flutter%20class/passing%20data%20between%20screen/using%20constructor/toStateless.dart';

void main(){
  runApp(MaterialApp(home: MainPage_2(),));
}
class MainPage_2 extends StatelessWidget {
  const MainPage_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Passing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DataStf(
                  name : "hello",
                  location : "Palarivattom",
                  phone : 91885726261,
                ))),
                child: Text("To Statefull")),
            ElevatedButton(onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DataStl(
                    name : "Hai",
                    location : "Palarivattom",
                    phone : 91885726261,
                ))),
                child: Text("To Stateless")),
          ],
        ),
      ),
    );
  }
}
