
import 'dart:convert';

import 'package:hellowcity/app/model/address_model.dart';
// import 'package:hellowcity/app/model/store_model.dart';
import 'package:hellowcity/app/services/api_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';

class StoreProvider extends ApiService{


  // Future<List<S>>getStoreList()async{
  //   List<StoreModel>_stores=[];
  //   // AddressModel _address=await Prefs.getUserAddress();
  //   // _stores=await  postRequest(ApiUrls.fetchStoresWithPinCode, (r){
  //   //   var res=jsonDecode(r.body);
  //   //   if(res['status']==1&&res['data']!=''){
  //   //     final parsed = res['data'].cast<Map<String, dynamic>>();
  //   //     return parsed.map<StoreModel>((json) => StoreModel.fromJson(json)).toList();
  //   //   }else{
  //   //     return _stores;
  //   //   }
  //   //
  //   //
  //   // },{'pincode':_address.pinCode}) as List<StoreModel>;
  //
  //   return _stores;
  // }
}