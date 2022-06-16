
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/api_checking_strings.dart';
import 'package:hellowcity/app/data/app_string.dart';


class AppStringService{

 static String getOrderStatus(String? val){
    if(val==ApiCheckingStings.pendingForApproval){
      return 'Pending for store/restaurant approval';
    }else if(val==ApiCheckingStings.notApprove){
      return 'Not Approve yet';
    }else if(val==ApiCheckingStings.cancelByUser){
      return AppString.cancelByYou.tr;
    }else if(val?.toLowerCase()==ApiCheckingStings.ongoing){
    return AppString.running.tr;
    }else if(val?.toLowerCase()==ApiCheckingStings.finish){
      return AppString.completed.tr;
    }else if(val?.toLowerCase()==ApiCheckingStings.cancelByRestaurant){
      return AppString.cancelByRestaurant.tr;
    }else if(val?.toLowerCase()==ApiCheckingStings.pendingForPayment){
      return AppString.pendingForPayment.tr;
    }
    return '';
  }

  static String getOrderType(String? val){
   if(val==ApiCheckingStings.deliveryOrder){
     return AppString.onDelivery.tr;
   }else if(val==ApiCheckingStings.cabinOrder){
     return AppString.cabin.tr;
   } else if(val==ApiCheckingStings.packingOrder){
     return AppString.packing.tr;
   }
   return AppString.all.tr;
  }
 static String getOrderSubType(String? val){
   if(val==ApiCheckingStings.itemOnly){
     return AppString.itemOnly.tr;
   }else if(val==ApiCheckingStings.onMinimumItemPurchase){
     return AppString.onMinimumItemPurchase.tr;
   }else if(val==ApiCheckingStings.onMinimumAmount){
     return AppString.onMinimumAmount.tr;
   }
   return AppString.all.tr;
 }
 static String deliveryPinCodeStatus(String? val){
   if(val==ApiCheckingStings.active){
     return AppString.active.tr;
   }else if(val==ApiCheckingStings.inActive){
     return AppString.inActive.tr;
   }
   return AppString.inActive.tr;
 }

 String serviceCategoryName(String? val){

   return'';
 }
}