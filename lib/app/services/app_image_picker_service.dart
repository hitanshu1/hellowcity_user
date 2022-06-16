
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/app_string.dart';
import '../shared/platformalertDialog.dart';

class AppImagePickerService{
  final ImagePicker _picker = ImagePicker();
  double _maxHeight=800;
  double _maxWidth=600;
  int _quality=50;

   Future<XFile?> onPickCameraImage()async{
    XFile? file= await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice:CameraDevice.front,
      maxWidth: _maxHeight,
      maxHeight: _maxWidth,
      imageQuality: _quality,
    );
    return file;
  }
  Future<List<XFile>?>pickMultiImagesFromGallery()async{
    List<XFile>?_files=[];
    try{
      _files=await _picker.pickMultiImage(
        imageQuality: _quality,
        maxHeight: _maxHeight,maxWidth: _maxWidth
      );
      return _files;
    }catch(e){
      return _files;
    }
  }
  Future<XFile?>pickSingleImagesFromGallery()async{
    XFile? file;
    try{
      file=await _picker.pickImage(source: ImageSource.gallery,

        maxWidth: _maxHeight,
        maxHeight: _maxWidth,
        imageQuality: _quality,
      );
      return file;

    }catch(e){
      return file;
    }
  }
  static void optionsPhoto({required BuildContext context,required Function onSelectCameraImage,
    required Function onSelectGalleryImage}) async {
    PlatformAlertDialog(
      barrierDismissible: true,
      title: AppString.getYourImage.tr,
      content: '\n${AppString.selectWhichImageOptionYouWantToChoose.tr}\n',
      defaultActionText: AppString.openCameraOption.tr,
      defaultActionText2:AppString.openGalleryOption.tr,
      defaultFunction: ()async{
        final _image = await ImagePicker().pickImage(source: ImageSource.camera);

        if(_image!=null){
          Navigator.pop(context);
          onSelectCameraImage(File(_image.path));
        }else{
          Navigator.pop(context);
          onSelectCameraImage(null);
        }


      },
      defaultFunction2: ()async{
        final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

        if(_image!=null){
          Navigator.pop(context);
          onSelectGalleryImage(File(_image.path));
        }else{
          Navigator.pop(context);
          onSelectGalleryImage(null);
        }

      },
    ).show(context);
  }

}