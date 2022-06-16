
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class AppFilePickerService{
  final ImagePicker _picker = ImagePicker();

 static Future<PlatformFile?>onPickFile(FileType type)async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type:type,allowMultiple: false,);
    if (result?.files.first != null){
      print('path====${result?.files.first.path}');
      return result!.files.first;
    }
  }
   Future<XFile?>getImage({ImageSource? source})async{
    XFile? image = await _picker.pickImage(source: source??ImageSource.gallery);
    if(image!=null){
      return image;
    }else{
      return null;
    }
  }
  static Future<List<PlatformFile>?> onPickMultiPleFile(FileType type)async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type:type,allowMultiple: true,);
    if(result?.files != null){
      return result!.files;
    }

  }
}