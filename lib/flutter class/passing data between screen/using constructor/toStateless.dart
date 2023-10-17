import 'package:flutter/material.dart';

class DataStl extends StatelessWidget {

  String name;
  String? location;
  int phone;

   DataStl({super.key, required  this.name, this.location, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name     : $name",style: TextStyle(fontSize: 30),),
            Text("Location : $location",style: TextStyle(fontSize: 20),),
            Text("phone    : $phone",style: TextStyle(fontSize: 10),)
          ],
        ),
      ),
    );
  }
}
