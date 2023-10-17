import 'package:flutter/material.dart';

class DataStf extends StatefulWidget {
  
  String name;
  String? location;
  int phone;
  DataStf({super.key, required this.name, this.location, required this.phone});

  @override
  State<DataStf> createState() => _DataStfState();
}

class _DataStfState extends State<DataStf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("name     : ${widget.name}",style: TextStyle(fontSize: 30),),
            Text("Location : ${widget.location}",style: TextStyle(fontSize: 20),),
            Text("Phone    : ${widget.phone}",style: TextStyle(fontSize: 10),)
          ],
        ),
      ),
    );
  }
}
