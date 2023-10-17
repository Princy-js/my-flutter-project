import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigScreen extends StatelessWidget {
  const BigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("D E S K T O P"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //First column
            Expanded(child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(aspectRatio: 16 / 4,
                  child: Container(
                    color: Colors.pink,
                  ),
                  ),
                ),
                // comment session and recommended videos
                Expanded(child: ListView.builder(
                  itemCount: 8,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.redAccent,
                        height: 120,
                      ),
                    );
                }
                )
                ),

              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
