
import 'dart:convert';

import 'package:hellowcity/app/data/api_urls.dart';
import 'package:hellowcity/app/model/app_charge.dart';
import 'package:hellowcity/app/services/api_service.dart';

class AppAdminProvider extends ApiService{


  Future<AppCharge?> getAppCharges() async {
    try{
      AppCharge appCharge = await getRequest(ApiUrls.getAppCharge,
              (r) {
            var res = jsonDecode(r.body);
            if(res['status']==1){
              return AppCharge.fromMap(res['data']);
            }else{
              return null;
            }
          },);
      return appCharge;
    }catch(e){
      return null;
    }


  }
  Future<String?> getAppVersion() async {
    try{
      String version = await getRequest(ApiUrls.getAppVersion,
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            return res['data']['version'];
          }else{
            return null;
          }
        },);
      return version;
    }catch(e){
      return null;
    }


  }
}