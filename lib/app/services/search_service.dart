
import 'package:hellowcity/app/model/product_item_model.dart';

class SearchService{


  static bool productAvailable(ProductItemModel product,String searchText){
    return (product.name??'').toLowerCase().contains(searchText.toLowerCase())||(product.subCategory??'').toLowerCase().contains(searchText.toLowerCase())||
        (product.category??'').toLowerCase().contains(searchText.toLowerCase());
  }
}