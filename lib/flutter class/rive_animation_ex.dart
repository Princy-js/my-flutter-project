import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: SimpleAnimation()));
}

class SimpleAnimation extends StatelessWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: 
          RiveAnimation.network("https://public.rive.app/community/runtime-files/5845-11463-curious-phone-girl.riv")
        // RiveAnimation.asset("assets/animation/sample.riv"),
      ),
    );
  }
}