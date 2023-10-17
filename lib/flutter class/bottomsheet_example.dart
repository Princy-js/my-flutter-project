import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: BottomSheetEx() ,));
}
class BottomSheetEx extends StatelessWidget {
  const BottomSheetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom sheet"),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: (){
       showTheSheet(context);

    },

            child: Image(image: AssetImage("assets/images/money.jpg")
      )
    ),
      ),
    );
  }

  void showTheSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
     return Column(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.start,
     children: [
     Text("Share via", style: TextStyle(fontSize: 20),),
       Divider(color: Colors.black54,),
       ListTile(leading: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.greenAccent,),title: Text("WhatsApp"),),
       ListTile(leading: FaIcon(FontAwesomeIcons.instagram,color: Colors.pink,),title: Text("Instagram"),)
     ]
     );
    });
  }
}
