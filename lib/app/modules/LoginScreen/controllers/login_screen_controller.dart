import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/model/api/user_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/providers/user_provider.dart';
import 'package:hellowcity/app/routes/app_pages.dart';
import 'package:hellowcity/app/services/app_get_service.dart';
import 'package:hellowcity/app/services/pref_service.dart';
enum LogInPageView{otp,password,register}
class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController
  final _firebaseAuth = FirebaseAuth.instance;
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController otpController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  bool isLoading=false;
  UserModel ?userDetails;
  LogInPageView view=LogInPageView.password;
  int otpStep=0;
  String ?verificationID;

  String get title{
    if(view==LogInPageView.otp){
      return AppString.loginWithOtp.tr;
    }else if(view==LogInPageView.register){
      return AppString.register.tr;
    }
    return AppString.loginWithPassword.tr;
  }



  void onChangePage(LogInPageView val){
    view=val;
    update();
  }
  @override
  void onInit() {
    otpStep=0;
    view=LogInPageView.password;
    verificationID=null;
    update();

    super.onInit();
  }

  void onLoginWithPassword() async{
    isLoading=true;
    update();
    ApiResponseModel response=await UserProvider().
    loginWithPassword(UserCredentials(phoneNumber: phoneNumberController.text, password: passwordController.text));
    if(response.status==1){
      Prefs.setUserDetails(response.user!);
      userDetails=response.user;
      print(response.user?.toJson());
      AppGetService.successSnackbar(response.message??'');
      AppGetService.navigateAndOff(Routes.HOME);
    }else{
      AppGetService.errorSnackbar(response.message??'');
    }
    isLoading=false;
    update();
  }
  void registerWithPassword()async{

    if (registerFormKey.currentState!.validate()) {
      isLoading=true;
      update();
      ApiResponseModel response=await UserProvider().
      registerWithPassword(UserCredentials(phoneNumber: phoneNumberController.text, password: passwordController.text,
          name: nameController.text));
      if(response.status==1){
        Prefs.setUserDetails(response.user!);
        userDetails=response.user;
        print(response.user?.toJson());
        AppGetService.successSnackbar(response.message??'');

        AppGetService.navigateAndOff(Routes.HOME);

      }else{
        AppGetService.errorSnackbar(response.message??'');
      }
      isLoading=false;
      update();
    }

  }
  void sendOtp()async{
    isLoading=true;
    update();
    try{
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+91'+phoneNumberController.text,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential){
            _firebaseAuth.signInWithCredential(authCredential).then((value){
              print(value.user?.uid);
            });
            isLoading=false;
            update();

          },
          verificationFailed:(FirebaseAuthException authException){
            print(authException);
            isLoading=false;
            update();
            AppGetService.errorSnackbar(authException.message??'');

          },
          codeSent: (String? verificationId, [int? forceResendingToken])async{
            isLoading=false;
            otpStep=1;
            verificationID=verificationId;
            ApiResponseModel response=await UserProvider().checkUser(phoneNumberController.text);
            if(response.alreadyHaveAccount==true){
              userDetails=userDetails;
            }

            update();
            AppGetService.successSnackbar('OTP send');

            //show dialog to take input from the user
          },
          codeAutoRetrievalTimeout: (String verificationId)async{
            verificationID = verificationId;
            isLoading=false;
            otpStep=1;
            ApiResponseModel response=await UserProvider().checkUser(phoneNumberController.text);
            if(response.alreadyHaveAccount==true){
              userDetails=response.user;

            }
            update();
            AppGetService.successSnackbar('OTP send');

          });
    }catch(e){
      isLoading=false;
      update();
    }


  }
  void verifyOtp()async {
    isLoading=true;
    update();
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: verificationID ?? '', smsCode: otpController.text);
    await _firebaseAuth
        .signInWithCredential(_authCredential).catchError((e){
      isLoading=false;
      update();
      AppGetService.errorSnackbar(e.message);
    }).then((val)async{
      if(val.user?.uid!=null){
        isLoading=false;
        update();
        if(userDetails!=null){
          AppGetService.successSnackbar('Login success');
          Prefs.setUserDetails(userDetails!);

          AppGetService.navigateAndOff(Routes.HOME);


        }else{
          ApiResponseModel response= await UserProvider().checkUser(phoneNumberController.text);
          if(response.status==1){

            Prefs.setUserDetails(response.user!);
            userDetails=response.user;
            AppGetService.back();
            AppGetService.successSnackbar(response.message??'');

          }
        }


      }else{
        isLoading=false;
        update();
        AppGetService.successSnackbar('Try Again');
      }

    });
  }
}
