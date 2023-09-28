import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(
    home: Lottie_Anima_Ex(),
  ));
}
class Lottie_Anima_Ex extends StatelessWidget {
  const Lottie_Anima_Ex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: 
        Lottie.asset("assets/animation/animation_1.json"),
        // Lottie.network("https://lottie.host/b5cb362a-93cf-4eff-a33c-96fcd15664ec/yPeUGWhIQ5.json")
      ),
    );
  }
}
