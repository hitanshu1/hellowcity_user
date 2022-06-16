import 'dart:convert';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/api/google_address.dart';
import 'package:hellowcity/app/model/api/google_address_result.dart';
import 'package:hellowcity/app/model/api/postal_address.dart';
import 'api_service.dart';

class GeoLocationService{

  static Future getAddressFromPinCode(String pinCode)async{
    return ApiService().getRequest('http://www.postalpincode.in/api/pincode/$pinCode',
            (response) {

          var res=jsonDecode(response.body);
          if(res['Status']=='Success'){
            if(res['PostOffice']!=null){
              PostalAddress _postalAddress=PostalAddress.fromJson(res['PostOffice'][0]);
              return GoogleAddress(
                state: _postalAddress.state,
                country: _postalAddress.country,
                pinCode: pinCode,
                city: _postalAddress.circle,
                addressLine: _postalAddress.description,


              );
            }

          }
        });


  }



}