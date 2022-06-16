
import 'dart:convert';
import 'dart:io';

import 'package:hellowcity/app/data/api_urls.dart';
import 'package:hellowcity/app/model/api/send_file_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/service_model.dart';
import 'package:hellowcity/app/services/api_service.dart';
import 'package:hellowcity/app/services/compress_service.dart';

class ServiceProvider extends ApiService{

  Future<ApiResponseModel>addUpdateService(ServiceModel credentials) async{
    List<SendFileCredentials>_list=[];
    if(credentials.logoImage!=null){
      File? _file=await CompressService.compressImage(File(credentials.logoImage!.path));
      if(_file!=null)
      _list.add(SendFileCredentials(file: _file,
          fieldName: 'company_logo'));
    }
    if(credentials.gstDoc!=null){
      _list.add(SendFileCredentials(file: credentials.gstDoc,
          fieldName: 'gst_doc'));
    }
    try{
      ApiResponseModel response = await postRequestWithFile(ApiUrls.addUpdateService,
              (r) {
            var res = jsonDecode(r.toString());
            return ApiResponseModel.fromJson(res);
          },
          _list,credentials.toJson());
      return response;

    }catch(e){
      print('error==$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }

  }
  Future<List<ServiceModel>> getUserServiceList(
      String userId) async {
    List<ServiceModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserServiceList+'/$userId',
            (r) {
          var res = jsonDecode(r.body);
          print('res==$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ServiceModel>((json) => ServiceModel.fromJson(json)).toList();
          }else{
            return [];
          }
        },);

      return _list;
    }catch(e){
      print('error=$e');
      return _list;
    }
  }
}