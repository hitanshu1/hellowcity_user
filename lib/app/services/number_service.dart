

import 'package:hellowcity/app/model/customer_order_model.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/model/res_own_order_food_item.dart';
import 'package:hellowcity/app/services/number_format_service.dart';

class NumberService{
  static String getTotalPriceFromOrderFoodList(List<ProductItemModel>list,{int? charge}){
    double _price=0;
    list.forEach((element) {
      _price+=(element.quantity*int.parse(element.price??'1'));
    });
    if(charge!=null){
      return '${_price+charge}';

    }else{
      return '$_price';
    }
  }
  static String getPriceAfterDiscount(String? price,String? discount){
    String _discountedPrice='${int.parse(price??'0')*
        (100-int.parse(discount??'0'))/100}';
    return _discountedPrice;
  }
  static String getTotalPrice(List<ProductItemModel>list){
    double totalPrice=0;
    list.forEach((element) {
      if(element.offer!=null){
        double price=double.parse(getPriceAfterDiscount(element.price,element.offer?.discount));
        totalPrice+=(price*element.quantity);
      }else{
        totalPrice+=(int.parse(element.price??'0')*element.quantity);
      }
    });

    return NumberFormatService.convertNumber('$totalPrice');
  }
  static String totalPriceWithTax(List<ProductItemModel>list,String? gst){
    double totalPrice=0;
    list.forEach((element) {
      if(element.offer!=null){
        double price=double.parse(getPriceAfterDiscount(element.price,element.offer?.discount));
        totalPrice+=(price*element.quantity);
      }else{
        totalPrice+=(int.parse(element.price??'0')*element.quantity);
      }
    });
    if(gst!=null){
      int? _percentage=int.tryParse(gst);
      if(_percentage!=null){
        totalPrice+=(totalPrice*(_percentage/100));
      }
    }

    return NumberFormatService.convertNumber('$totalPrice');
  }
  static String  getProductPrice(ProductItemModel val){
    double totalPrice=0;
    if(val.offer!=null){
      double price=double.parse(getPriceAfterDiscount(val.price,val.offer?.discount));
      totalPrice+=(price*val.quantity);
    }else{
      totalPrice+=(int.parse(val.price??'0')*val.quantity);
    }
    return NumberFormatService.convertNumber('$totalPrice');
  }
  static String  getProductSinglePrice(ProductItemModel val){
    double totalPrice=0;
    if(val.offer!=null){
       totalPrice=double.parse(getPriceAfterDiscount(val.price,val.offer?.discount));
    }else{
      totalPrice+=(int.parse(val.price??'0'));
    }
    return NumberFormatService.convertNumber('$totalPrice');
  }
  static String getGst(int percentage,List<ProductItemModel>list){
    double gst=(double.parse(getTotalPrice(list))*(percentage/100)).roundToDouble();
    return '${ NumberFormatService.convertNumber('$gst')}';
  }
  static String grandTotal(int percentage,int serviceTax,List<ProductItemModel>list){
    double gst=(double.parse(getTotalPrice(list))*(percentage/100)).roundToDouble();
    double _grandTotal=double.parse(getTotalPrice(list))+gst+serviceTax;
    return '${ NumberFormatService.convertNumber('$_grandTotal')}';
  }
  static String totalAppCharge(CustomerOrderModel order){
    double _charge=0;
    _charge=double.parse(order.serviceTax??'0')+double.parse(order.tax??'0');
    return NumberFormatService.convertNumber('$_charge');
  }

  static String getPriceFormatFromString(String? price ){
    if(price!=null){
      return NumberFormatService.convertNumber(price);
    }else{
      return '0.00';
    }
  }
  static double getPercentageFromSell(double highest,{String?val}){
    double _percentage=0;
    if(val!=null){
      double _doubleVal=double.tryParse(val)??0;
      _percentage=(_doubleVal/highest)*100;

    }
    return _percentage;
  }

}