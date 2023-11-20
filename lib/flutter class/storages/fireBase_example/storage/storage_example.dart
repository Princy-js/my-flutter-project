import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: "AIzaSyCkMmTdNtDOsIIYsEy2ryKAqYi8FnHI98Q",//current_key
          appId: "1:594394372620:android:0f6c91c5101419b528ac29",//mobilesdk_app_id
          messagingSenderId: '',//null
          projectId: "flutter-project1-f3a86",
          storageBucket: "flutter-project1-f3a86.appspot.com"
      )
  );
  runApp(MaterialApp(home: StorageFireBase(),));
}
class StorageFireBase extends StatefulWidget {
  const StorageFireBase({super.key});

  @override
  State<StorageFireBase> createState() => _StorageFireBaseState();
}

class _StorageFireBaseState extends State<StorageFireBase> {
  //object of firebase storage
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('FireBase Storage') ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    onPressed: () =>upload('Camera'),
                  minWidth: 120,
                  height: 40,
                  color: Colors.pink,
                  child: Text('camera'),
                ),
                MaterialButton(
                    onPressed: () =>upload('Gallery'),
                  minWidth: 120,
                  height: 40,
                  color: Colors.blueAccent,
                child: Text('Gallery'),
                )
              ],
            ),
            Expanded(
                child:FutureBuilder(
                  //if firebase connection is success and firebase have data then executes this function
                    future: loadData(),
                    builder:(context,
                        AsyncSnapshot<List<Map<String,dynamic>>> snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context,index){
                          //to fetch each map from the list
                          final Map<String,dynamic> image = snapshot.data![index];
                          return Card(
                            child: ListTile(
                              //leading : Image.network(snapsht.data![index]['key of map']),
                              ///OR 
                              leading: Image.network(image['imageurl']),
                              title: Text(image['uploaded_by']),
                              subtitle: Text(image['description']),
                              trailing: IconButton(
                                  onPressed: ()=>deleteimage(image['path']),
                                  icon: Icon(Icons.delete)),
                            ),
                          );
                        });
                      }
                      else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }

 Future<List<Map<String,dynamic>>> loadData() async{
    List<Map<String,dynamic>> images = [];
    final ListResult result = await storage.ref().list();//group of values from firebase storage
    //all the data from firebase stored as areference
    final List<Reference> allfiles = result.items;

    await Future.forEach(allfiles, (singlefile) async{
      //to get image path(path as network image path)
      final String fileurl = await singlefile.getDownloadURL();
      final FullMetadata metadata = await singlefile.getMetadata();

      images.add({
        'imageurl': fileurl,
        'path': singlefile.fullPath,
        'uploaded_by':metadata.customMetadata?['uploaded_by'] ?? "No data",
        'description':metadata.customMetadata?['description'] ?? "No data"
      });
    }) ;
   return images;
 }

  Future<void> upload(String imageinput) async {
    final picker = ImagePicker();
    XFile? pickedImage; // platform dependent path
    try {
      pickedImage = await picker.pickImage(
          source: imageinput == "Camera"
              ? ImageSource.camera
              : ImageSource.gallery);
      final String filename = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path); // relative path

      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'SomeOne!!!',
              'description': 'Some Description....'
            }));

        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

 Future<void> deleteimage(String imagepath) async{
    await storage.ref(imagepath).delete();
    setState(() {});
 }


}