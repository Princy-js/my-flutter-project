import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: PermissionPageState(),
  ));
}

class PermissionPageState extends StatefulWidget {
  const PermissionPageState({super.key});

  @override
  State<PermissionPageState> createState() => _PermissionPageStateState();
}

class _PermissionPageStateState extends State<PermissionPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: requestCamerapermission,
                child: Text('Request Camera Permission')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: requestMultiplePermission,
                child: Text('Request Multiple Permission')),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: permissionWithOpenSettings,
                child: Text('Open Permission Settings'))
          ],
        ),
      ),
    );
  }
  /// status can either be: granted, denied, restricted or permanentlyDenied
  void requestCamerapermission() async {
    var status = await Permission.camera.status;
    if(status.isGranted){
        ImagePicker picker = ImagePicker();
        picker.pickImage(source: ImageSource.camera);
        print('Permission Granted');
    }
    else if(status.isDenied){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permission Denied')));
      /// We didn't ask for permission yet or the permission has been denied before but not permanently.
      if(await Permission.camera.request().isGranted){
        // Either the permission was already granted before or the user just granted it.
        print('Permission was granted');
      }
    }
  }
  /// Request multiple permissions at once.
  /// In this case location & storage
  void requestMultiplePermission() async{
    Map<Permission,PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.photos
    ].request();
    print('location permission : ${statuses[Permission.location]}'
    'storage permission : ${statuses[Permission.storage]}'
    );
  }

  /// The user opted to never again see the permission request dialog for this
  /// app. The only way to change the permission's status now is to let the
  /// user manually enable it in the system settings.
 void permissionWithOpenSettings() async{
    openAppSettings();
 }
}
