import 'dart:io';

import 'package:file_picker/file_picker.dart';

class UserCredentials{
  String ?id;
  String? phoneNumber;
  String? password;
  String ? name;
  File? profilePicFile;
  UserCredentials({this.phoneNumber,this.password,this.name,this.profilePicFile,this.id});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    if(id!=null){
      data['id']=id??'';
    }
    if(phoneNumber!=null){
      data['phone'] = phoneNumber??'';
    }
    if(password!=null){
      data['password'] = password??'';
    }

    if(name!=null){
      data['name']=name??'';
    }

    return data;
  }
}