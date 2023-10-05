import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/lottie_animation_example.dart';
import 'package:new_flutter_project_class/flutter%20class/navigationPageDrawer.dart';

void main(){
  runApp(MaterialApp(
    home: ExampleDrawer(),
  ));
}
class ExampleDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
       title: Text("AppBar"),
     ),
     drawer: Drawer(

       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topRight,
               end: Alignment.bottomLeft,
               colors:
           [
             Colors.amber,
             Colors.orangeAccent,
             Colors.deepOrangeAccent,
             Colors.deepOrange,
             Colors.redAccent,
           ])
         ),
         child: ListView(
           children: [
             SizedBox(
               height: 30,
             ),

             ListTile(
               leading: CircleAvatar(
                 backgroundImage: AssetImage("assets/images/sundarPichai.jpg"),
               ),
               title: Text("Sundhar Pichai",
                   style: TextStyle(
                   color: Colors.white70
               ),
               ),
               subtitle: Text("CEO of Alphabet inc",
                 style: TextStyle(
                     color: Colors.white70
                 ),
               ),
             ),
             SizedBox(
               height: 30,
             ),
             ListTile(
               onTap: (){
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NavigationPageExample()));
               },
               leading: Icon(Icons.dashboard,color: Colors.white70,),
               title: Text("dashboard",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),

             // ListTile(
             //   leading: Icon(Icons.dashboard,color: Colors.white70,),
             //   title: Text("dashboard",
             //     style: TextStyle(
             //         color: Colors.white70
             //     ),),
             // ),
             ListTile(
               leading: Icon(Icons.leak_add_sharp,color: Colors.white70,),
               title: Text("Leads",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.group,color: Colors.white70,),
               title: Text("Clients",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.airplanemode_active,color: Colors.white70,),
               title: Text("Projects",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.accessibility,color: Colors.white70,),
               title: Text("patients",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.subject,color: Colors.white70,),
               title: Text("Subscription",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.payments_sharp,color: Colors.white70,),
               title: Text("Payments",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.account_circle,color: Colors.white70,),
               title: Text("Users",
                 style: TextStyle(
                     color: Colors.white70
                 ),),
             ),
             ListTile(
               leading: Icon(Icons.library_books_outlined,color: Colors.white70,),
               title: Text("Users",
               style: TextStyle(
                 color: Colors.white70
               ),
               ),
             ),
             SizedBox(
               height: 36,
             ),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.red,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20), // Button border radius
                 ),
                 minimumSize: Size(310, 45), // Set the desired width and height
               ),
               onPressed: () {
                 // Add your onPressed logic here
               },
               child: Text('logout'),
             ),
           ],
         ),
       ),
     ),
   );
  }

}