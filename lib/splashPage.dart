import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // to run an app
  runApp(MaterialApp(
    //default theme of our flutter app
    home: SplashPage(), //initial page to be launched while running an app
  ));
}

class SplashPage extends StatelessWidget {
  @override
  //build functionality: to create our widget tree we use build function
  Widget build(BuildContext context) {
    //Build context : used to locate the widgets in the widget tree and monitor their actions
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(image: AssetImage("assets/icons/sonic-generations-icon.png"),
             width: 100,
              height: 100,
             ),
            // Image(image: NetworkImage("https://cdn1.iconfinder.com/data/icons/space-travel-flat/340/space_astronomy_universe_galaxy_astronaut_cosmonaut_science_spaceman_travel_walk-64.png")),
            // Icon(
            //     Icons.cake_sharp,
            //     size: 80,
            //     ),
            Text("My App",
              style: GoogleFonts.dancingScript(
                fontSize: 30,
                color: Colors.pink
              )
              // TextStyle(
              //     fontSize: 40,
              //     fontStyle: FontStyle.italic,
              //     color: Colors.yellow)
            )
          ],
        ),
      ),
    );
  }
}
