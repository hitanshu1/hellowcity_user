import 'package:get/get.dart';
import 'package:hellowcity/app/data/cash_free_constants.dart';
import 'package:hellowcity/app/model/api/cash_free/cash_free_order_model.dart';
import 'package:hellowcity/app/model/api_response_model.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/modules/MyBookings/controllers/my_bookings_controller.dart';
import 'package:hellowcity/app/providers/restaurant_provider.dart';
import 'package:hellowcity/app/providers/user_provider.dart';

class BookingDetailsController extends GetxController {
  //TODO: Implement BookingDetailsController

  BookingModel ? booking;
  bool isLoading=false;

  MyBookingsController myBookingsController=Get.put(MyBookingsController());

  void initializeData(BookingModel val){
    isLoading=true;
    update();
    booking=val;
    isLoading=false;
    update();
  }

  void onUpdateBookingStatus(String status)async{

    isLoading=true;
    update();
    ApiResponseModel response=await RestaurantProvider().updateBookingStatus(
        BookingModel(id: booking?.id,status:status ));
    if(response.status==1){
      booking?.status=status;
      update();
      myBookingsController.getBookingList();
    }
    isLoading=false;
    update();
  }
  void payCashFreePlugIn()async{
    ApiResponseModel responseModel=  await UserProvider().payCashFreePlugin(CashFreeOrderModel(
        stage: CashFreeConstants.stage,
        orderId: booking?.id.toString(),
        orderAmount: '500',
        customerName: 'hitanshu',
        orderNote: 'Order Note',
        orderCurrency: 'INR',
        appId: CashFreeConstants.appId,
        customerPhone: '7002780550',
        customerEmail: 'hitanshugogoi@gmail.com',
        notifyUrl: ''

    ));
    if(responseModel.status==1){
      print('success');
    }
  }
}
