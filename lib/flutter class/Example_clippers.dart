import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Example_clipper(),));
}
class Example_clipper extends StatelessWidget {
  const Example_clipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ///ClipRect : Rectangle clipper
            ClipPath(
              child: Container(
                child: Align(
                  widthFactor: .5,
                  heightFactor: .6,
                  alignment: Alignment.center,
                  child: Image.network("https://images.unsplash.com/photo-1673253408723-b5cfbfe00af6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80"),
                ),
              ),
            ),
            ///round rectangle
            ClipRRect(
              
            )
          ],
        ),
      ),
    );
  }
}
