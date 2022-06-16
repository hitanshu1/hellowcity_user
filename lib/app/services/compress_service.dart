
import 'dart:io';
import 'dart:math' as Math;
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
class CompressService{

  static Future<File?> compressImage(File val)async{


    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(10000);

    Im.Image? image = Im.decodeImage(val.readAsBytesSync());

    int actualHeight = image?.height??0;
    int actualWidth = image?.width??0;
   var maxHeight = 600;
   var maxWidth = 800;
   var imgRatio = actualWidth/actualHeight;
   var maxRatio = maxWidth/maxHeight;
    var compressionQuality = 50;
   if (actualHeight > maxHeight || actualWidth > maxWidth){
     if(imgRatio < maxRatio){
       //adjust width according to maxHeight
       imgRatio = maxHeight / actualHeight;
       actualWidth = (imgRatio*actualWidth).toInt();
       actualHeight = maxHeight;
     }
     else if(imgRatio > maxRatio){
       //adjust height according to maxWidth
       imgRatio = maxWidth / actualWidth;
       actualHeight = (imgRatio * actualHeight).toInt();
       actualWidth = maxWidth;
     }
     else{
       actualHeight = maxHeight;
       actualWidth = maxWidth;
     }
   }
   if(image!=null){
     Im.Image smallerImage = Im.copyResize(image, width: actualWidth,height: actualHeight);
     late File compressedImage;
     if(image!=null){
       compressedImage = new File('${path}/img_$rand.jpg')..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: compressionQuality
         ,));
     }


     return compressedImage;
   }


  }
}