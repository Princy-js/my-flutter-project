import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(
    home: FiAtmCard(),
  ));
}
class FiAtmCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.teal,
                ),
              ),
              Positioned(
                top: 70,
                  left: 30,
                  child: Row(
               children: [
                 Image(image: AssetImage("assets/images/download-removebg-preview.png"),
                 width: 60,
                   height: 60,
                 ),
                 Transform.rotate(
                     angle:90 * pi /180,
                     child: FaIcon(
                       FontAwesomeIcons.wifi,
                       color: Colors.white,))
               ],
              )),
              Positioned(
                top: 200,
                  left: 20,
                  child: Text("Princy J",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                  )),
              Positioned(
                top: 180,
                  right: 20,
                  child: Image(
                      image: AssetImage("assets/images/visa.png"),
                     width: 70,
                    height: 70,
                  )),
              Positioned(
                top: 10,
                  left: 320,
                  child: Image(
                      image: AssetImage("assets/images/fi.png"),
                    color: Colors.grey,
                    width: 80,
                    height: 80,
                  ))
            ],
          ),
        ),
    );
  }

}