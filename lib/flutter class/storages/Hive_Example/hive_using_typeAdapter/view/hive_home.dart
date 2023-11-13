import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HiveHome extends StatelessWidget {
 String? email;
 
 HiveHome({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcom $email',style: GoogleFonts.hahmlet(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.pink),),
      ),
    );
  }
}
