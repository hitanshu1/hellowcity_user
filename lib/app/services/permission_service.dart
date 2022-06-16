
import 'package:permission_handler/permission_handler.dart';

class AppPermission{


  static void appBlueToothPermission()async{
    try{
      await Permission.bluetooth.request();
      await Permission.bluetoothConnect.request();
      await Permission.bluetoothScan.request();
      await Permission.location.request();

    }catch(e){
      print('error==$e');
    }
    // if(!await Permission.bluetoothConnect.request().isGranted){
    //   await Permission.bluetooth.request();
    //   await Permission.bluetoothConnect.request();
    //   await Permission.bluetoothScan.request();
    // }

  }
  static Future<bool> allowLocation()async{
   //  final storageResult=await Permission.photos.request();
   //  final storageResult2=await Permission.storage.request();
   //  final storageResult3=await Permission.camera.request();
   // final result= await Permission.location.request();

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.camera,
      Permission.photos
    ].request();
    print('status store===${statuses[Permission.storage]},2===${statuses[Permission.camera]},3 ${statuses[Permission.photos]}');

   // print(result);

   // if(result.isGranted){
    if(statuses.isNotEmpty){
     return true;
   }

    return false;
  }
}