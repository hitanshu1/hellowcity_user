import 'package:get/get.dart';

import '../modules/AboutUs/bindings/about_us_binding.dart';
import '../modules/AboutUs/views/about_us_view.dart';
import '../modules/ActiveCabin/bindings/active_cabin_binding.dart';
import '../modules/ActiveCabin/views/active_cabin_view.dart';
import '../modules/ActiveCabinOrderDetails/bindings/active_cabin_order_details_binding.dart';
import '../modules/ActiveCabinOrderDetails/views/active_cabin_order_details_view.dart';
import '../modules/AddOrChangeDeliveryAddress/bindings/add_or_change_delivery_address_binding.dart';
import '../modules/AddOrChangeDeliveryAddress/views/add_or_change_delivery_address_view.dart';
import '../modules/AllProducts/bindings/all_products_binding.dart';
import '../modules/AllProducts/views/all_products_view.dart';
import '../modules/AllowLocationPermission/bindings/allow_location_permission_binding.dart';
import '../modules/AllowLocationPermission/views/allow_location_permission_view.dart';
import '../modules/BookCabin/bindings/book_cabin_binding.dart';
import '../modules/BookCabin/views/book_cabin_view.dart';
import '../modules/BookingDetails/bindings/booking_details_binding.dart';
import '../modules/BookingDetails/views/booking_details_view.dart';
import '../modules/CompletedOrderDetails/bindings/completed_order_details_binding.dart';
import '../modules/CompletedOrderDetails/views/completed_order_details_view.dart';
import '../modules/ContactUs/bindings/contact_us_binding.dart';
import '../modules/ContactUs/views/contact_us_view.dart';
import '../modules/EditProfile/bindings/edit_profile_binding.dart';
import '../modules/EditProfile/views/edit_profile_view.dart';
import '../modules/EnterLocation/bindings/enter_location_binding.dart';
import '../modules/EnterLocation/views/enter_location_view.dart';
import '../modules/LandingScreen/bindings/landing_screen_binding.dart';
import '../modules/LandingScreen/views/landing_screen_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/MyBookings/bindings/my_bookings_binding.dart';
import '../modules/MyBookings/views/my_bookings_view.dart';
import '../modules/MyOrders/bindings/my_orders_binding.dart';
import '../modules/MyOrders/views/my_orders_view.dart';
import '../modules/OrderCheckOut/bindings/order_check_out_binding.dart';
import '../modules/OrderCheckOut/views/order_check_out_view.dart';
import '../modules/OrderDetails/bindings/order_details_binding.dart';
import '../modules/OrderDetails/views/order_details_view.dart';
import '../modules/ResCustomerItemDetails/bindings/res_customer_item_details_binding.dart';
import '../modules/ResCustomerItemDetails/views/res_customer_item_details_view.dart';
import '../modules/RestaurantDetails/bindings/restaurant_details_binding.dart';
import '../modules/RestaurantDetails/views/restaurant_details_view.dart';
import '../modules/SearchCabin/bindings/search_cabin_binding.dart';
import '../modules/SearchCabin/views/search_cabin_view.dart';
import '../modules/SearchProductItem/bindings/search_product_item_binding.dart';
import '../modules/SearchProductItem/views/search_product_item_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/StoreRestaurantList/bindings/store_restaurant_list_binding.dart';
import '../modules/StoreRestaurantList/views/store_restaurant_list_view.dart';
import '../modules/SubmitProductReview/bindings/submit_product_review_binding.dart';
import '../modules/SubmitProductReview/views/submit_product_review_view.dart';
import '../modules/UserCart/bindings/user_cart_binding.dart';
import '../modules/UserCart/views/user_cart_view.dart';
import '../modules/ViewAllReview/bindings/view_all_review_binding.dart';
import '../modules/ViewAllReview/views/view_all_review_view.dart';
import '../modules/ViewAllShoppingCategory/bindings/view_all_shopping_category_binding.dart';
import '../modules/ViewAllShoppingCategory/views/view_all_shopping_category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ALLOW_LOCATION_PERMISSION,
      page: () => AllowLocationPermissionView(),
      binding: AllowLocationPermissionBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_LOCATION,
      page: () => EnterLocationView(),
      binding: EnterLocationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_SCREEN,
      page: () => LandingScreenView(),
      binding: LandingScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.RES_CUSTOMER_ITEM_DETAILS,
      page: () => ResCustomerItemDetailsView(
        foodItem: Get.arguments,
      ),
      binding: ResCustomerItemDetailsBinding(),
    ),
    GetPage(
      name: _Paths.USER_CART,
      page: () => UserCartView(),
      binding: UserCartBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_CHECK_OUT,
      page: () => OrderCheckOutView(),
      binding: OrderCheckOutBinding(),
    ),
    GetPage(
      name: _Paths.ADD_OR_CHANGE_DELIVERY_ADDRESS,
      page: () => AddOrChangeDeliveryAddressView(
        selectedAddress: Get.arguments,
      ),
      binding: AddOrChangeDeliveryAddressBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDERS,
      page: () => MyOrdersView(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: _Paths.STORE_RESTAURANT_LIST,
      page: () => StoreRestaurantListView(
        type: Get.arguments,
      ),
      binding: StoreRestaurantListBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_DETAILS,
      page: () => RestaurantDetailsView(
        restaurant: Get.arguments,
      ),
      binding: RestaurantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_CABIN,
      page: () => BookCabinView(),
      binding: BookCabinBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_CABIN,
      page: () => SearchCabinView(),
      binding: SearchCabinBinding(),
    ),
    GetPage(
      name: _Paths.MY_BOOKINGS,
      page: () => MyBookingsView(),
      binding: MyBookingsBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVE_CABIN,
      page: () => ActiveCabinView(),
      binding: ActiveCabinBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVE_CABIN_ORDER_DETAILS,
      page: () => ActiveCabinOrderDetailsView(
        order: Get.arguments,
      ),
      binding: ActiveCabinOrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT_ITEM,
      page: () => SearchProductItemView(
        arguments: Get.arguments,
      ),
      binding: SearchProductItemBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAILS,
      page: () => BookingDetailsView(
        booking: Get.arguments,
      ),
      binding: BookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED_ORDER_DETAILS,
      page: () => CompletedOrderDetailsView(
        order: Get.arguments,
      ),
      binding: CompletedOrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_SHOPPING_CATEGORY,
      page: () => ViewAllShoppingCategoryView(),
      binding: ViewAllShoppingCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_PRODUCT_REVIEW,
      page: () => SubmitProductReviewView(
        productReview: Get.arguments,
      ),
      binding: SubmitProductReviewBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_REVIEW,
      page: () => ViewAllReviewView(),
      binding: ViewAllReviewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
