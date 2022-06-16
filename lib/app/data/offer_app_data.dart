
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/model/offer_model.dart';
import 'package:hellowcity/app/model/value_and_title_model.dart';

import 'api_checking_strings.dart';
import 'app_string.dart';

class OfferAppData{

  static List<ValueAndTitleModel>offerSubTypes=[
    ValueAndTitleModel(
      val: ApiCheckingStings.itemOnly,
      title: AppString.itemOnly.tr
    ),
    ValueAndTitleModel(
        val: ApiCheckingStings.onMinimumItemPurchase,
        title: AppString.onMinimumItemPurchase.tr
    ),
    ValueAndTitleModel(
        val: ApiCheckingStings.onMinimumAmount,
        title: AppString.onMinimumAmount.tr
    ),
    ValueAndTitleModel(
        val: ApiCheckingStings.all,
        title: AppString.all.tr
    ),
  ];
  static String getSubTypeFromValue(StoreResOfferModel val){
    if(val.subtype==ApiCheckingStings.onMinimumAmount){
      return  AppString.onMinimumAmount.tr+' '+AppString.rupeeSymbol+'${val.minimumAmount}';
    }else  if(val.subtype==ApiCheckingStings.itemOnly){
      return  AppString.itemOnly.tr;
    }else  if(val.subtype==ApiCheckingStings.onMinimumItemPurchase){
      return  AppString.onMinimumItemPurchase.tr+' '+'${val.minimumItems}';
    }
    return AppString.all.tr;
  }
  static String getTypeFromValue(String val){
    if(val==ApiCheckingStings.onDelivery){
      return  AppString.onDelivery.tr;
    }else  if(val==ApiCheckingStings.onPlace){
      return  AppString.onPlace.tr;
    }
    return AppString.all.tr;
  }

}