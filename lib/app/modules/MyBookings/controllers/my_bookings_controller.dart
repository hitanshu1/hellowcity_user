import 'package:get/get.dart';
import 'package:hellowcity/app/model/booking_model.dart';
import 'package:hellowcity/app/modules/home/controllers/home_controller.dart';
import 'package:hellowcity/app/providers/user_provider.dart';

class MyBookingsController extends GetxController {
  //TODO: Implement MyBookingsController

  bool isLoading=false;

  List<BookingModel>bookingList=[];
  HomeController homeController=Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    getBookingList();
  }

  void getBookingList()async{
    isLoading=true;
    update();
    bookingList=await UserProvider().getUserBookingList(homeController.userDetails?.id?.toString()??'');
    isLoading=false;
    update();
    if(bookingList.length>1){
      bookingList.sort((a,b)=>b.id!.compareTo(a.id!));
      update();
    }
  }


}
