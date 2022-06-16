import 'package:get/get.dart';
import 'package:hellowcity/app/model/app_charge.dart';
import 'package:hellowcity/app/model/customer_order_model.dart';
import 'package:hellowcity/app/modules/UserCart/controllers/user_cart_controller.dart';
import 'package:hellowcity/app/providers/app_admin_provider.dart';
import 'package:hellowcity/app/services/number_service.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController


  bool isLoading=false;

  CustomerOrderModel? orderDetails=CustomerOrderModel();

  UserCartController userCartController=Get.put(UserCartController());

  List<int>addedStore=[];
  AppCharge? appCharge;

  @override
  void onInit() {
    super.onInit();
    orderDetails?.itemWithStoreList=[];
    userCartController.productList.forEach((product) {

      print('store==${product.storeRestaurant?.toJson()}');

      if(!addedStore.contains(product.storeRestaurant?.id)){
        print('working1');
        addedStore.add(product.storeRestaurant!.id!);
        product.storeRestaurant?.type=product.type;
        orderDetails?.itemWithStoreList?.add(StoreResWithProductItem(
            itemList: [product],
            storeRestaurant: product.storeRestaurant
        ));
        update();

      }else{
        orderDetails?.itemWithStoreList?.forEach((element) {
          if(element.storeRestaurant?.id==product.storeRestaurant?.id){
            element.itemList?.add(product);

            update();
          }
        });
      }

    });
    print('list2====${orderDetails?.itemWithStoreList?.length}');
    getAppCharge();

  }

  void getAppCharge()async{
    isLoading=true;
    update();
    appCharge= await AppAdminProvider().getAppCharges();
    update();
    if(appCharge!=null){
      orderDetails?.serviceTax='${appCharge?.serviceTax??0}';
      orderDetails?.subTotal=NumberService.getTotalPrice(userCartController.productList);
      orderDetails?.grandTotal=NumberService.grandTotal(appCharge?.gstPercentage??0, appCharge?.serviceTax??0, userCartController.productList);
      orderDetails?.tax=NumberService.getGst(appCharge?.gstPercentage??0, userCartController.productList);
      update();
    }
    isLoading=false;
    update();

  }

}
