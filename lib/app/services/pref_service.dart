
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Prefs{


  static String isPlaying='is_playing';
  static void setUserLocation(AddressModel addressVal)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppString.city, addressVal.city??'');
    preferences.setString(AppString.pincode, addressVal.pinCode??'');
    preferences.setString(AppString.name, addressVal.name??'');
    preferences.commit();
  }

  static Future<AddressModel>getUserAddress()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? pinCode=preferences.getString(AppString.pincode);
    String? city=preferences.getString(AppString.city);
    String? userName=preferences.getString(AppString.name);

    return AddressModel(city: city,pinCode: pinCode,
    name: userName);
  }
  static Future<UserModel?>getUserDetails()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString(AppString.name);
    String? userImage = preferences.getString(AppString.userImage);
    String? email=preferences.getString(AppString.email);
    String? phone=preferences.getString(AppString.phone);
    int? userId=preferences.getInt(AppString.userId);

    if(userId!=null){
      return UserModel(
          id:userId,
          name: name,
          profilePic: userImage,
          phoneNumber: phone
      );
    }

  }
  static void setUserDetails(UserModel userVal)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppString.name, userVal.name??'');
    preferences.setString(AppString.userImage, userVal.profilePic??'');
    preferences.setString(AppString.phone, userVal.phoneNumber??'');
    if(userVal.id!=null){
      preferences.setInt(AppString.userId, userVal.id!);
    }

    preferences.commit();
  }




  static void logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(AppString.name);
    preferences.remove(AppString.userImage);
    preferences.remove(AppString.phone);
    preferences.remove(AppString.userId);
    final _firebaseAuth = FirebaseAuth.instance;
    if(_firebaseAuth.currentUser!=null){
      _firebaseAuth.signOut();
    }

    // preferences.clear();
    preferences.commit();
    setView(false);
    // AppGetService.navigateTo(Routes.MAIN_HOME);
  }
  static void setFirstTime()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isFirstTime', false);
    preferences.commit();
  }

  static Future<bool>getFirstTime()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isFirstTime')??true;

  }
  static void setView(bool val)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('serviceView', val);
    preferences.commit();
  }
  static Future<bool>getView()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('serviceView')??false;

  }
  static setPlaying(bool val)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isPlaying, val);

  }
  static Future<bool>getPlaying()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? _play=prefs.getBool(isPlaying);
    return _play??false;
  }



}