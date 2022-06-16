import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/model/category.dart';
import 'api_checking_strings.dart';
import 'app_assets.dart';
import 'app_string.dart';
import 'enum/product_offer_type.dart';
import 'enum/store_offer_type.dart';

class AppData{

  static List<String>jobTypes=[AppString.contractBasis,AppString.regularBasis];

  static List<CategoryModel>servicesList=[
    CategoryModel(name: AppString.deliveryServices.tr,val: ApiCheckingStings.deliveryServices, imageUrl: AppAssets.deliveryColor,subCategory: AppString.services),
    CategoryModel(name: AppString.electronicsComputer.tr,val: ApiCheckingStings.electronicsComputer, imageUrl: AppAssets.electronics,subCategory: AppString.services),
    CategoryModel(name:AppString.educationClasses.tr,val: ApiCheckingStings.educationClasses, imageUrl: AppAssets.education,subCategory: AppString.services),
    CategoryModel(name: AppString.driversTaxi.tr, val: ApiCheckingStings.driversTaxi,imageUrl: AppAssets.driver,subCategory: AppString.services),
    CategoryModel(name: AppString.healthBeauty.tr,val: ApiCheckingStings.healthBeauty, imageUrl: AppAssets.health,subCategory: AppString.services),
    CategoryModel(name: AppString.otherServices.tr,val: ApiCheckingStings.otherServices, imageUrl: AppAssets.others,subCategory: AppString.services)
  ];
  static List<CategoryModel>shoppingList=[
    CategoryModel(name: AppString.stores.tr, imageUrl: AppAssets.store,subCategory: AppString.store),
    CategoryModel(name: AppString.restaurantDhaba.tr, imageUrl: AppAssets.restaurant,subCategory: AppString.store),
    // CategoryModel(name: 'Shop from HellowCity', imageUrl: AppAssets.appIcon,subCategory: AppString.store),
    CategoryModel(name: AppString.allProducts.tr, imageUrl: AppAssets.all_product,subCategory: AppString.store),

  ];

  static String buysome='Buy Some quantity and get additional quantity';
  static String specialDiscountSome='Special discount on some quantity';
  static String specialDiscount='Special discount';
  static String getadditionalproduct='Get Addition Product';

  static List<ProductOfferV> productofferList=[
    ProductOfferV(
      offertitle: buysome,
        productOfferType: ProductOfferType.BuysomeQuantityAndGetAdditionalQuantity
    ),
    ProductOfferV(
        productOfferType: ProductOfferType.DiscountSomeQuantity,
      offertitle: specialDiscountSome
    ),
    ProductOfferV(
        productOfferType: ProductOfferType.SpecialDiscount,
      offertitle: specialDiscount
    ),
    ProductOfferV(
        productOfferType: ProductOfferType.GetAdditionalProduct,
        offertitle: getadditionalproduct
    )
  ];
  static String offerOnMiniMumProductPurchase='Offer on minimum product purchase';
  static String offerOnMinimumAmountPurchase='Offer on minimum amount purchase';
  static String forAll='For All';
  static List<StoreOfferV> storeOfferList=[
    StoreOfferV(
      offerTitle: offerOnMiniMumProductPurchase,
      storeOfferType: StoreOfferType.MinimumProductPurchase,
    ),
    StoreOfferV(
      offerTitle: offerOnMinimumAmountPurchase,
      storeOfferType: StoreOfferType.MinimumAmountPurchase,
    ),
    StoreOfferV(
      offerTitle: forAll,
      storeOfferType: StoreOfferType.ForAll,
    )
  ];
}

class ProductOfferV{
  String offertitle;
  ProductOfferType productOfferType;
  ProductOfferV({required this.productOfferType,required this.offertitle});

}
class StoreOfferV{
  String offerTitle;
  StoreOfferType storeOfferType;
  StoreOfferV({required this.storeOfferType,required this.offerTitle});
}
class ServieA{
  String name;
  String asset;
  ServieA({required this.name,required this.asset});
}