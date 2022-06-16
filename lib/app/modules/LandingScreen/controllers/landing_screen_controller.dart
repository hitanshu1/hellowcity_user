import 'package:get/get.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_string.dart';

class LandingScreenController extends GetxController {
  //TODO: Implement LandingScreenController

  int step=1;

  void onChangeStep(){
    step++;
    update();
  }
  double get percentage{
    return 1-(1-step/2);
  }
  String get title{

    return AppString.searchTitle.tr;
  }
  String get subTitle{

    return AppString.searchSubtitle.tr;
  }
  String get assetString{

    return AppAssets.searchIntro;
  }
}
