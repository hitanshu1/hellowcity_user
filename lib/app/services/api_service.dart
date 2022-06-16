import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hellowcity/app/model/api/phone_auth_response.dart';
import 'package:hellowcity/app/model/api/send_file_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class ApiService{
  final _firebaseAuth = FirebaseAuth.instance;

  final client = http.Client();
  Future<dynamic> getRequest(String path, Function(Response) success) async {
    return _processResponse(await client.get(Uri.tryParse(path)!,), success);
  }


  Future<dynamic> postRequest(String path, Function(Response) success, [Object? body,Map<String,String>? headers]) async {
    return _processResponse(
        await client.post(
            Uri.tryParse(path)!,
            /// change made body to jsonEncode(body)
            body: body
        ), success
    );
  }
  Future<dynamic> postRequestWithFile(String path, Function(String) success,List<SendFileCredentials> files ,[Map<String,String>? body]) async {
    var request = http.MultipartRequest('POST', Uri.parse(path));
    if(files.isNotEmpty){
      files.forEach((element) async{
        print('type===${element.file.runtimeType}');
        if(element.file.runtimeType==XFile){
          print('======1');
          // var bytes = element.file.readAsBytes();
          // request.files.add(await http.MultipartFile.fromPath(element.fieldName, await bytes,
          // filename: element.file.name));
          request.files.add(await http.MultipartFile.fromPath(element.fieldName,element.file.path));
        }else{
          print('======2${element.file.path}');
          // request.files.add(
          //     http.MultipartFile.fromBytes(
          //         element.fieldName,
          //         element.file.bytes?.toList(),
          //         filename: element.file.name
          //     )
          // );
          request.files.add(
             await http.MultipartFile.fromPath(
                  element.fieldName,
                  element.file.path,
              )
          );
        }



    });
    }

    if(body!=null){
      request.fields.addAll(body);
    }



    var response = await request.send();
    var data= await response.stream.transform(utf8.decoder);
    String? responseData=await data.single;
    return success(responseData);
  }


  Future<dynamic> putRequest(String path, Function(Response) success, [Map? body]) async {
    return _processResponse(
        await client.put(
            Uri.tryParse(path)!,
//            body: body != null ? jsonEncode(body.toJson()) : null
            body: body
        ), success
    );
  }


  Future<dynamic> deleteRequest(String path, Function(Response) success) async {
    return _processResponse(await client.delete(Uri.tryParse(path)!,), success);
  }

  dynamic _processResponse(Response response, Function(Response) success) {


    return success(response);
    // if (200 >= response.statusCode && response.statusCode < 300) {
    //   return success(response);
    // } else {
    //   return ApiError.fromJson(json.decode(response.body));
    // }
  }
  Future<PhoneAuthResponse?> signInWithPhone(String phone) async{
    PhoneAuthResponse? _response;

    try{
     final _result= await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential){
            _firebaseAuth.signInWithCredential(authCredential).then((value){
              print(value.user?.uid);
            });
            print('1');
            _response =PhoneAuthResponse();

          },
          verificationFailed:(FirebaseAuthException authException){
            print(authException);
            print('2');
            _response= PhoneAuthResponse(status: 0,message: authException.message,
                verificationId: '');

          },
          codeSent: (String? verificationId, [int? forceResendingToken]){
            print('3');
            _response=PhoneAuthResponse(verificationId: verificationId,status: 1,message: 'Otp Send');
            //show dialog to take input from the user
          },
          codeAutoRetrievalTimeout: (String verificationId){
            verificationId = verificationId;
            print(verificationId);
            print("Timout");
            print('4');
            _response=PhoneAuthResponse(verificationId: verificationId,status: 1,message: 'Otp Send');
          });


      return _response;


    }catch(e){
      print('error==$e');

      return PhoneAuthResponse(verificationId: null,message: "#####################${e.toString()}",status: 0);

    }

  }
  Future<ApiResponseModel> verifyOtp(String verificationID,String otp)async{
    AuthCredential _authCredential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);

    UserCredential _user=await _firebaseAuth
        .signInWithCredential(_authCredential);
    if(_user.user?.uid!=null){
      return ApiResponseModel(status: 1,message: 'Successfully login');
    }else{
      return ApiResponseModel(status: 0,message: 'Wrong otp');
    }

  }

}