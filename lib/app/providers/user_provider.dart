import 'dart:convert';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:hellowcity/app/data/api_urls.dart';
import 'package:hellowcity/app/data/cash_free_constants.dart';
import 'package:hellowcity/app/model/address_model.dart';
import 'package:hellowcity/app/model/api/add_to_cart_credentials.dart';
import 'package:hellowcity/app/model/api/add_wish_list_credentials.dart';
import 'package:hellowcity/app/model/api/cash_free/cash_free_order_model.dart';
import 'package:hellowcity/app/model/api/cash_free/cash_free_ui_data.dart';
import 'package:hellowcity/app/model/api/check_serviceable_pincode_credentials.dart';
import 'package:hellowcity/app/model/api/delete_cart_credentials.dart';
import 'package:hellowcity/app/model/api/send_file_credentials.dart';
import 'package:hellowcity/app/model/api/user_credentials.dart';
import 'package:hellowcity/app/model/api/phone_auth_response.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/model/customer_order_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/product_rating.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/model/store_res_rating.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/model/usermodel.dart';
import 'package:hellowcity/app/services/api_service.dart';

class UserProvider extends ApiService {


  Future<ApiResponseModel> loginWithPassword(
      UserCredentials credentials) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.loginWithPassword,
              (r) {

            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }
  Future<ApiResponseModel> registerWithPassword(UserCredentials credentials) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.registerWithPassword,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<UserModel?>getUserDetails(String id)async{
    UserModel? userModel=await getRequest(ApiUrls.getUserDetails+'/$id', (r){
      var res = jsonDecode(r.body);
      print('res==${res}');
      if(res['status']==1){
        return UserModel.fromJson(res['user']);
      }
    });
    return userModel;
  }
  Future<ApiResponseModel> addToCart(AddToCartCredentials credentials) async {
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.addToCart,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addOrRemoveToWishList(AddWishListCredentials credentials) async {
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.addOrRemoveToWishList,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addToWishList(AddWishListCredentials credentials) async {
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.addToWishList,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<ProductItemModel>> getUserCartProductList(
      String userID) async {
    List<ProductItemModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserCartList+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ProductItemModel>((json) => ProductItemModel.fromJson(json)).toList();
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
  Future<List<ProductItemModel>> getUserWishListProducts(
      String userID) async {

    print('${ApiUrls.getUserWishList}'+'/$userID');

    List<ProductItemModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserWishList+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ProductItemModel>((json) => ProductItemModel.fromJson(json)).toList();
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
  Future<ApiResponseModel> addOrUpdateUserAddress(AddressModel credentials) async {
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.addOrUpdateUserAddress,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<AddressModel?> getUserDefaultAddress(String userId) async {
    try{
      AddressModel? response = await getRequest(ApiUrls.getUserDefaultAddress+'/$userId',
              (r) {
            var res = jsonDecode(r.body);
            print('data===${res}');
            if(res['data']!=null){
              return AddressModel.fromMap(res['data']);
            }

          },
          );
      return response;
    }catch(e){
      print('error==$e');
      return null;
    }
  }
  Future<List<AddressModel>> getUserAddressList(
      String userID) async {

    print('${ApiUrls.getUserWishList}'+'/$userID');

    List<AddressModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserAddressList+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<AddressModel>((json) => AddressModel.fromMap(json)).toList();
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

  Future<ApiResponseModel> setUserDefaultAddress(AddressModel credentials)async{
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.setUserDefaultAddress,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<StoreRestaurantModel>> getStoreResListIfUnserviceable(CheckServiceablePinCodeCredentials credentials)async{
    try{
      List<StoreRestaurantModel>_list=[];
      _list = await postRequest(ApiUrls.checkDeliveryStatusForCartItem,
              (r) {
            var res = jsonDecode(r.body);
            if(res['status']==1){
              return [];
            }else{
              final parsed = res['data'].cast<Map<String, dynamic>>();
              return parsed.map<StoreRestaurantModel>((json) => StoreRestaurantModel.fromJson(json)).toList();
            }
          },
          credentials.toJson());
      return _list;
    }catch(e){
      return [];
    }
  }

  Future<ApiResponseModel>customerPlaceOrder(CustomerOrderModel credentials)async{
    try{
      print(credentials.toJson());
    ApiResponseModel response = await postRequest(ApiUrls.onPlaceCustomerOrder,
            (r) {
          var res = jsonDecode(r.body);
          print('res====$res');
          return ApiResponseModel.fromJson(res);
        }, credentials.toJson());
    return response;
  }catch(e){
      print('error=$e');
  return ApiResponseModel(status: 0,message: e.toString());
  }
  }
  Future<ApiResponseModel>deleteCartItem(DeleteCartCredentials credentials)async{
    try{
      print(credentials.toJson());
      ApiResponseModel response = await postRequest(ApiUrls.deleteCartItem,
              (r) {
            var res = jsonDecode(r.body);
            print('res====$res');
            return ApiResponseModel.fromJson(res);
          }, credentials.toJson());
      return response;
    }catch(e){
      print('error=$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }

  Future<List<StoreRestaurantOrderModel>> getUserOrderList(String id)async{
    List<StoreRestaurantOrderModel>_list=[];
    try{

      _list = await getRequest(ApiUrls.getUserOrderList+'/$id',
              (r) {
            var res = jsonDecode(r.body);

            if(res['status']==1){
              print(res['data']);
              final parsed = res['data'].cast<Map<String, dynamic>>();
              return parsed.map<StoreRestaurantOrderModel>((json) => StoreRestaurantOrderModel.fromJson(json)).toList();

            }else{
              return [];
            }
          },);
      return _list;
    }catch(e){
      return _list;
    }
  }

  Future<PhoneAuthResponse?>sendOtp(String phone)async{
    return signInWithPhone(phone);
  }
  Future<ApiResponseModel>verifyWithOtp(String verificationId,String otp){
    return verifyOtp(verificationId, otp);
  }
  Future<ApiResponseModel>checkUser(String phone)async{
    try{
      ApiResponseModel response = await postRequest(ApiUrls.checkUser,
              (r) {
            var res = jsonDecode(r.body);
            print('res====$res');
            return ApiResponseModel.fromJson(res);
          },{
        'phone':phone
          });
      return response;
    }catch(e){
      print('error=$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel>CreateNewUserWithPhone(String phone)async{
    try{
      ApiResponseModel response = await postRequest(ApiUrls.createNewUserWithPhone,
              (r) {
            var res = jsonDecode(r.body);
            print('res====$res');
            return ApiResponseModel.fromJson(res);
          },{
            'phone':phone
          });
      return response;
    }catch(e){
      print('error=$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<BookingModel>> getUserBookingList(
      String userID) async {


    List<BookingModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserBookingList+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<BookingModel>((json) => BookingModel.fromJson(json)).toList();
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
  Future<List<StoreRestaurantOrderModel>> getUserActiveCabinOrders(
      String userID) async {
    List<StoreRestaurantOrderModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserActiveCabinOrderList+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreRestaurantOrderModel>((json) => StoreRestaurantOrderModel.fromJson(json)).toList();
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
  Future<ApiResponseModel>payCashFreePlugin(CashFreeOrderModel order)async{
    ApiResponseModel response=await postRequest(CashFreeConstants.apiUrl,
            (r)async {
          var res= jsonDecode(r.body);
          order.tokenData = res['cftoken'];
          print('Token : ' + order.tokenData.toString());
          // If server returns an OK response, parse the JSON.
          var inputs = order.toMap();
          inputs.addAll(UIMeta().toMap());
          inputs.putIfAbsent('tokenData', () {
            return res['cftoken'];
          });
          inputs.forEach((key, value) {
            print("$key : $value");
          });
          Map? _values=await CashfreePGSDK.doPayment(inputs);

          return ApiResponseModel(
              status: '${_values?['txStatus']}'.toLowerCase()=='success'?1:0,
              data: _values
          );
        },jsonEncode({
          'orderId':  order.orderId??'',
          'orderAmount': order.orderAmount??'',
          'orderCurrency':  order.orderCurrency??'',
        }),{
          'x-client-id': CashFreeConstants.appId,
          'x-client-secret': CashFreeConstants.secretKey,
          'Content-Type': 'application/json'
        });
    return response;
  }

  Future<ApiResponseModel>rateProduct(ProductRating productRating)async{
    try{
      ApiResponseModel response = await postRequest(ApiUrls.rateProduct,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },productRating.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel>rateStoreRes(StoreResRating storeResRating)async{
    try{
      ApiResponseModel response = await postRequest(ApiUrls.rateStoreRes,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },storeResRating.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel>reviewProduct(ProductReview review)async{
    try{
      ApiResponseModel response = await postRequest(ApiUrls.submitProductReview,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },review.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel>updateUserDetails(UserCredentials credentials)async{
    try{
      if(credentials.profilePicFile!=null){
        ApiResponseModel response = await postRequestWithFile(ApiUrls.updateUserDetails,
                (r) {

              var res = jsonDecode(r);
              return ApiResponseModel.fromJson(res);
            },[SendFileCredentials(file: credentials.profilePicFile,
                fieldName: 'image')],credentials.toJson());
        return response;
      }else{
        ApiResponseModel response = await postRequestWithFile(ApiUrls.updateUserDetails,
                (r) {

              var res = jsonDecode(r);
              return ApiResponseModel.fromJson(res);
            },[],credentials.toJson());
        return response;
      }

    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }

}
