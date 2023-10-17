import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Run(),
  ));
}

class Run extends StatelessWidget {
  var orientation, height, width;

  @override
  Widget build(BuildContext context) {
    ///getting the orientation of the app
    orientation = MediaQuery.of(context).orientation;

    ///Size of the window
    /// size = MediaQuery.of(context).size

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation MediaQuery"),
        backgroundColor: Colors.green,
      ),

      ///checking the orientation
      body: orientation == Orientation.portrait
          ? Container(
              color: Colors.pink,
              height: height / 2,
              width: width / 4,
            )
          : Container(
              height: height / 2,
              width: width / 2,
              color: Colors.blueAccent,
            ),
    );
  }
}
