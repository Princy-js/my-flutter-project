import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpage stf.dart';
import 'loginpage stl.dart';

void main() {
  // to run an app
  runApp(MaterialApp(
    //default theme of our flutter app
    home: Splash2(), //initial page to be launched while running an app
  ));
}

class Splash2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>Splash2State();



}

class Splash2State extends State{
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage2()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[
                  Colors.blueAccent,
                  Colors.teal,
                  Colors.green,
                  Colors.greenAccent,
                  Colors.white38,
                  Colors.white
                ] )
          // color: Colors.teal
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //     image: NetworkImage("https://images.unsplash.com/photo-1694528162642-e59afd291f46?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/icons/sonic-generations-icon.png"),
                width: 100,
                height: 100,
              ),
              // Image(image: NetworkImage("https://cdn1.iconfinder.com/data/icons/space-travel-flat/340/space_astronomy_universe_galaxy_astronaut_cosmonaut_science_spaceman_travel_walk-64.png")),
              // Icon(
              //     Icons.cake_sharp,
              //     size: 80,
              //     ),
              Text("My Application",
                  style: GoogleFonts.dancingScript(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight:FontWeight.bold
                  )
                // TextStyle(
                //     fontSize: 40,
                //     fontStyle: FontStyle.italic,
                //     color: Colors.yellow)
              )
            ],
          ),
        ),
      ),
    );
  }

}