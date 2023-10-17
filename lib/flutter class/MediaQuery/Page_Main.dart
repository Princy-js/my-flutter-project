import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BigPage.dart';
import 'mobilePage.dart';

void main(){
  runApp(MaterialApp(home: HomePage(),));
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    if(devicewidth < 600){
      return MobileScreen();
    }
    else{
      return BigScreen();
    }
  }
}
