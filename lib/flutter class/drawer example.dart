import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: DrawerExample(),
  ));
}
class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("MY DRAWER")
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
               decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/backround.jpg"))
        ),
                accountName: Text("Alexander"),
                accountEmail: Text("alex123@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:  AssetImage("assets/images/pexels-stefan-stefancik-91227.jpg")),
              otherAccountsPictures: [
                CircleAvatar(
                    backgroundImage:  AssetImage("assets/images/pexels-stefan-stefancik-91227.jpg")),
                CircleAvatar(
                    backgroundImage:  AssetImage("assets/images/pexels-stefan-stefancik-91227.jpg")),
              ],
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("favorite"),
            ),

            ListTile(
              leading: Icon(Icons.work_history),
              title: Text("Work"),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("Notification"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            )




          ],
        ),
      ),
    );
  }
}
