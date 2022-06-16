
import 'dart:convert';
import 'dart:io';

import 'package:hellowcity/app/data/api_urls.dart';
import 'package:hellowcity/app/model/api/add_cabin_table_credentials.dart';
import 'package:hellowcity/app/model/api/add_category_credentials.dart';
import 'package:hellowcity/app/model/api/add_manager_waiter_credentials.dart';
import 'package:hellowcity/app/model/api/add_new_order_credentials.dart';
import 'package:hellowcity/app/model/api/add_order_item_credentials.dart';
import 'package:hellowcity/app/model/api/add_pincode_credentials.dart';
import 'package:hellowcity/app/model/api/add_store_res_product_item_credentials.dart';
import 'package:hellowcity/app/model/api/add_res_offer_credentials.dart';
import 'package:hellowcity/app/model/api/add_store_res_credentials.dart';
import 'package:hellowcity/app/model/api/get_customer_res_item_credentials.dart';
import 'package:hellowcity/app/model/api/get_store_res_credentials.dart';
import 'package:hellowcity/app/model/api/send_customer_request_credentials.dart';
import 'package:hellowcity/app/model/api/send_file_credentials.dart';
import 'package:hellowcity/app/model/api/update_gst_credentials.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/app_res_delivery_product.dart';
import 'package:hellowcity/app/model/app_res_stock_model.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/model/cabin_model.dart';
import 'package:hellowcity/app/model/delivery_pincode_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import 'package:hellowcity/app/model/product_review.dart';
import 'package:hellowcity/app/model/restaurant_stock_model.dart';
import 'package:hellowcity/app/model/store_res_category_model.dart';
import 'package:hellowcity/app/model/res_manager_model.dart';
import 'package:hellowcity/app/model/res_waiter_model.dart';
import 'package:hellowcity/app/model/store_res_time_table.dart';
import 'package:hellowcity/app/model/store_restaurant_model.dart';
import 'package:hellowcity/app/model/store_restaurant_order_model.dart';
import 'package:hellowcity/app/services/api_service.dart';
import 'package:hellowcity/app/services/compress_service.dart';

class RestaurantProvider extends ApiService{


  Future<List<StoreRestaurantModel>> getAllRestaurantList() async {
    List<StoreRestaurantModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserAllResDhaba+'',
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreRestaurantModel>((json) => StoreRestaurantModel.fromJson(json)).toList();
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
  Future<List<StoreRestaurantModel>> getUserRestaurantList(
      String userID) async {
    List<StoreRestaurantModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserAllResDhaba+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print('$userID data===$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreRestaurantModel>((json) => StoreRestaurantModel.fromJson(json)).toList();
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
  Future<List<StoreRestaurantModel>> getUserStoreList(
      String userID) async {
    List<StoreRestaurantModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getUserAllStores+'/$userID',
            (r) {
          var res = jsonDecode(r.body);
          print('$userID data===$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreRestaurantModel>((json) => StoreRestaurantModel.fromJson(json)).toList();
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
  Future<List<Cabin>> getCabinAndTableList(
      String resDhabaID) async {
    List<Cabin>_list=[];
    try{
      _list= await getRequest(ApiUrls.getResDhabaCabinNTableList+'/$resDhabaID',
            (r) {
          var res = jsonDecode(r.body);
          print('cabin===${res}');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<Cabin>((json) => Cabin.fromJson(json)).toList();
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
  Future<List<StuffModel>> getWaiterList(
      String store_res_id) async {
    List<StuffModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResStuffList+'/$store_res_id',
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StuffModel>((json) => StuffModel.fromJson(json)).toList();
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
  Future<List<StoreRestaurantOrderModel>> getStoreResOwnOrderList(
      String store_res_id) async {
    List<StoreRestaurantOrderModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResOwnOrderList+'/$store_res_id',
            (r) {
          var res = jsonDecode(r.body);
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
  Future<List<StoreRestaurantOrderModel>>getStoreResDeliveryOrderList(String storeResID)async{
    List<StoreRestaurantOrderModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResDeliveryOrderList+'/$storeResID',
            (r) {
          var res = jsonDecode(r.body);
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
  Future<ApiResponseModel> addNewStoreResOwnOrder(
      AddNewOrderCredentials credentials) async {
    print('newOrderCred===${credentials.toJson()}');
    try{
      ApiResponseModel response = await postRequest(ApiUrls.addStoreResOwnOrder,
              (r) {
            var res = jsonDecode(r.body);
            print('res===$res');
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }
  Future<List<ProductItemModel>> getStoreResItemList(
      String resDhabaID) async {

    print(ApiUrls.getStoreResItems+'/$resDhabaID');
    List<ProductItemModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResItems+'/$resDhabaID',
            (r) {
          var res = jsonDecode(r.body);
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
  Future<List<ProductItemModel>> getOrderFoodList(
      String orderId) async {
    List<ProductItemModel>_list=[];
    try{
      _list= await postRequest(ApiUrls.getProductItemsOwnOrder,
            (r) {
          var res = jsonDecode(r.body);
          print('res==$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ProductItemModel>((json) => ProductItemModel.fromJson(json)).toList();
          }else{
            return [];
          }
        }, {
            'id':orderId,
            'status':'active'
          });

      return _list;
    }catch(e){
      print('error=$e');
      return _list;
    }
  }
  Future<StoreRestaurantOrderModel?> getResOrderDetails(String orderId) async {
    try{
      StoreRestaurantOrderModel order = await getRequest(ApiUrls.getStoreResOrderDetails+'/$orderId',
            (r) {
          var res = jsonDecode(r.body);
          return StoreRestaurantOrderModel.fromJson(res['data']);
        },);
      return order;
    }catch(e){
      return null;
    }


  }
  Future<ApiResponseModel> addItemToResOwnOrder(
      AddOrderItemCredentials credentials) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.addItemToOrder,
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
  Future<ApiResponseModel> deleteOrderFoodItem(
      String id,String orderID) async {
    try{
      print('$id====$orderID');

      ApiResponseModel response = await postRequest(ApiUrls.deleteOrderProductItem,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id,'order_id':orderID});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }
  Future<ApiResponseModel> finishRestaurantOrder(
      String id,String grandTotal) async {
    try{
      print('id==$id====$grandTotal');

      ApiResponseModel response = await postRequest(ApiUrls.finishStoreResOwnOrder,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id,'grand_total':grandTotal});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addCategory(
      AddCategoryCredentials credentials) async {
    print('cred===${credentials.toJson()}');
    try{

      ApiResponseModel response = await postRequest(ApiUrls.addStoreResCategory,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<StoreResCategoryModel>> getResCategoryList(
      String resID) async {
    List<StoreResCategoryModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResCategoryList+'/$resID',
            (r) {
          var res = jsonDecode(r.body);
          print('res==$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreResCategoryModel>((json) => StoreResCategoryModel.fromJson(json)).toList();
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
  Future<ApiResponseModel> deleteResCategory(
      String id) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResCategory,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }
  Future<ApiResponseModel> addProductOrItem(
      AddStoreResProductItemCredentials credentials) async {

    List<SendFileCredentials>_list=[];
    if(credentials.files!=null){
      credentials.files?.forEach((element) async{
        File? _file=await CompressService.compressImage(File(element.path!));
        if(_file!=null){
          _list.add(SendFileCredentials(file: _file,
              fieldName: 'images[]'));
        }

      });


    }
    try{

      ApiResponseModel response = await postRequestWithFile(ApiUrls.addProductOrItem,
              (r) {

            var res = jsonDecode(r.toString());
            print('res===$res');
            return ApiResponseModel.fromJson(res);
          },
          _list,credentials.toJson());
      return response;
    }catch(e){
      print('error==$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }
  Future<ApiResponseModel> deleteResFoodItem(
      String id) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResProductItem,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> deleteProductItemImage(
      String id) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.deleteProductImage,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addResCabinTable(
      AddCabinTableCredentials credentials) async {
    try{


      ApiResponseModel response = await postRequest(ApiUrls.addUpdateStoreResCabinTable,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> DeleteResCabin(
      String id) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResCabin,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addResManager(
      AddManagerWaiterCredentials credentials) async {
    try{
      print('==${credentials.toJson()}');
      ApiResponseModel response = await postRequest(ApiUrls.addStoreResManager,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> assignAsManager(
      AddManagerWaiterCredentials credentials) async {
    try{
      print('==${credentials.toJson()}');

      ApiResponseModel response = await postRequest(ApiUrls.assignAsManager,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> assignAsStuff(
      AddManagerWaiterCredentials credentials) async {
    try{
      print('==${credentials.toJson()}');

      ApiResponseModel response = await postRequest(ApiUrls.assignAsStuff,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addResWaiter(
      AddManagerWaiterCredentials credentials) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.addStoreResStuff,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<ResManagerModel>> getResManagerList(
      String resID) async {
    List<ResManagerModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResManagerList+'/$resID',
            (r) {
          var res = jsonDecode(r.body);
          print('res==$res');
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ResManagerModel>((json) => ResManagerModel.fromJson(json)).toList();
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
  Future<ApiResponseModel> deleteResManager(
      String id) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResManager,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> deleteResWaiter(
      String id) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResStuff,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> addStoreOrRestaurant(
      AddStoreResCredentials credentials) async {
    print('cred===${credentials.toJson()}');

    List<SendFileCredentials>_list=[];
    if(credentials.resImage!=null){
      File? _file=await CompressService.compressImage(File(credentials.resImage!.path));
      if(_file!=null){
        _list.add(SendFileCredentials(file: _file,
            fieldName: 'store_res_image'));
      }

    }
    if(credentials.gstDoc!=null){
      _list.add(SendFileCredentials(file: credentials.gstDoc!,
          fieldName: 'gst_doc'));
    }
    if(credentials.fssaiDoc!=null){
      _list.add(SendFileCredentials(file: credentials.fssaiDoc!,
          fieldName: 'fssai_doc'));
    }
    if(credentials.tradeDoc!=null){
      _list.add(SendFileCredentials(file: credentials.tradeDoc!,
          fieldName: 'trade_doc'));
    }
    try{

      ApiResponseModel response = await postRequestWithFile(ApiUrls.addStoreResDhaba,
              (r) {

            var res = jsonDecode(r.toString());
            print('res===$res');
            return ApiResponseModel.fromJson(res);
          },
          _list,credentials.toJson());
      return response;

    }catch(e){
      print('error==$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }

  Future<ApiResponseModel> addStoreResPinCode(
      AddPinCodeCredentials credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.addUpdateStoreResDeliveryPinCode,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      print('e==$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<ApiResponseModel> deleteStoreResPinCode(
      String id) async {
    try{
      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResDeliveryPincode,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      print('e==$e');
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<DeliveryPinCodeModel>> getStoreResinCodePinCode(
      String id) async {
    List<DeliveryPinCodeModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResDeliveryPincodeList+'/$id',
              (r) {
            var res = jsonDecode(r.body);
            if(res['status']==1){
              final parsed = res['data'].cast<Map<String, dynamic>>();
              return parsed.map<DeliveryPinCodeModel>((json) => DeliveryPinCodeModel.fromJson(json)).toList();
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
  Future<List<StoreRestaurantModel>> getStoreRestaurantListByPinCode(
      GetStoreResCredentials credentials) async {
    List<StoreRestaurantModel>_list=[];
    try{
      _list= await postRequest(ApiUrls.getStoreResListByPincode,
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreRestaurantModel>((json) => StoreRestaurantModel.fromJson(json)).toList();
          }else{
            return [];
          }
        },credentials.toJson());

      return _list;
    }catch(e){
      print('error=$e');
      return _list;
    }
  }
  Future<ApiResponseModel> addStoreResOffer(
      AddStoreResOfferCredentials credentials) async {
    print('newOrderCred===${credentials.toJson()}');
    try{
      ApiResponseModel response = await postRequest(ApiUrls.addAndUpdateStoreResOffer,
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
  Future<ApiResponseModel> deleteStoreResOffer(
      String id) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.deleteStoreResOffer,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }


  }

  Future<List<StoreResOfferModel>> getRestaurantOfferList(
      String resID) async {
    List<StoreResOfferModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResOfferList+'/$resID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreResOfferModel>((json) => StoreResOfferModel.fromMap(json)).toList();
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
  Future<List<StoreResOfferModel>> getAllStoreResOfferList() async {
    List<StoreResOfferModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResAllOfferList,
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<StoreResOfferModel>((json) => StoreResOfferModel.fromMap(json)).toList();
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
  Future<ProductItemModel?> getCustomerFoodItemDetails(
      GetCustomerResItemCredentials credentials) async {
    try{
      ProductItemModel? foodItem = await postRequest(ApiUrls.getStoreResFoodItemDetails,
              (r) {
            var res = jsonDecode(r.body);
            if(res['status']==1){
              print(res);
              return ProductItemModel.fromJson(res['data']);
            }else{
              return null;
            }
          },
          credentials.toJson());
      return foodItem;
    }catch(e){
      print('error==$e');
      return null;
    }


  }
  Future<ApiResponseModel> AddEditRestaurantStock(
      RestaurantStockModel credentials) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.addEditRestaurantStock,
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
  Future<List<RestaurantStockModel>> getRestaurantStockList(
      String resID) async {
    List<RestaurantStockModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getRestaurantStockList+'/$resID',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<RestaurantStockModel>((json) => RestaurantStockModel.fromJson(json)).toList();
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
  Future<ApiResponseModel> deleteRestaurantStock(
      String id) async {
    try{

      ApiResponseModel response = await postRequest(ApiUrls.deleteRestaurantStock,
              (r) {
            var res = jsonDecode(r.body);
            return ApiResponseModel.fromJson(res);
          },
          {'id':id});
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<AppResDeliveryProduct>> getAppStoreResDeliveryProductList(String pincode,type) async {
    List<AppResDeliveryProduct>_list=[];
    try{
      _list= await postRequest(ApiUrls.getAppRestaurantDeliveryProductList,
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<AppResDeliveryProduct>((json) => AppResDeliveryProduct.fromJson(json)).toList();
          }else{
            return [];
          }
        },{
        'pincode':pincode,'type':type
          });

      return _list;
    }catch(e){
      print('error=$e');
      return _list;
    }
  }

  Future<ApiResponseModel> buyAndUpdateRestaurantStockOrder(
      AppResStockModel credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.addEditResStockOrder,
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
  Future<List<AppResStockModel>>getRestaurantOrderStockList(String storeResID)async{
    List<AppResStockModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getResOrderedStockList+'/$storeResID',
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<AppResStockModel>((json) => AppResStockModel.fromJson(json)).toList();
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
  Future<ApiResponseModel> deleteRestaurantOrderedStock(
      AppResStockModel credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.deleteResStockorder,
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
  Future<ApiResponseModel> addUpdateStoreResGSTPercentage(
      UpdateGstCredentials credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.addUpdateGstPercentage,
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
  Future<ApiResponseModel> sendCustomerRequest(
      SendCustomerRequestCredentials credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.sendCustomerRequest,
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
  Future<List<StoreRestaurantOrderModel>>getStoreResAllOrders(String storeResID)async{
    List<StoreRestaurantOrderModel>_list=[];
    try{
      _list= await getRequest(ApiUrls.getStoreResAllOrder+'/$storeResID',
            (r) {
          var res = jsonDecode(r.body);
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
  Future<ApiResponseModel> bookRestaurantCabin(
      BookingModel credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.bookResCabin,
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
  Future<ApiResponseModel> updateBookingStatus(
      BookingModel credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.updateBookingStatus,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<StoreResTimeTable?> getStoreResTimeTable(
      String storeResID) async {
    try{
      StoreResTimeTable table = await getRequest(ApiUrls.getStoreResTimeTable+'/$storeResID',
            (r) {
          var res = jsonDecode(r.body);
          print('res===$res');
          if(res['status']==1){
            return StoreResTimeTable.fromJson(res['data']);
          }

        },
      );
      return table;
    }catch(e){
      return null;
    }
  }
  Future<ApiResponseModel> addUpdateStoreResTimeTable(
      StoreResTimeTable credentials) async {
    try{
      print(credentials.toJson());

      ApiResponseModel response = await postRequest(ApiUrls.addUpdateStoreResTimeTable,
              (r) {
            var res = jsonDecode(r.body);
            print(res);
            return ApiResponseModel.fromJson(res);
          },
          credentials.toJson());
      return response;
    }catch(e){
      return ApiResponseModel(status: 0,message: e.toString());
    }
  }
  Future<List<ProductItemModel>>getStoreResProductByPinCode(String pinCode,String type)async{
    List<ProductItemModel>_list=[];
    try{
      _list= await postRequest(ApiUrls.getAllProductListByPincode,
            (r) {
          var res = jsonDecode(r.body);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ProductItemModel>((json) => ProductItemModel.fromJson(json)).toList();
          }else{
            return [];
          }
        },{'pincode':pinCode,
          'type':type});

      return _list;
    }catch(e){
      print('error=$e');
      return _list;
    }
  }
  Future<List<ProductReview>> getProductReviewList(
      String productId) async {
    List<ProductReview>_list=[];
    try{
      print(ApiUrls.getProductReviewList+'/$productId');
      _list= await getRequest(ApiUrls.getProductReviewList+'/$productId',
            (r) {
          var res = jsonDecode(r.body);
          print(res);
          if(res['status']==1){
            final parsed = res['data'].cast<Map<String, dynamic>>();
            return parsed.map<ProductReview>((json) => ProductReview.fromJson(json)).toList();
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