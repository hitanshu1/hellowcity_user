import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/size_config.dart';

import 'package:hellowcity/app/shared/view_app_image.dart';


class EmptyOfferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: SizeConfig.screenHeight*.2,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return ViewAppImage(
              height: SizeConfig.screenHeight*.2,
              width: SizeConfig.screenWidth,
              assetsUrl: AppAssets.offerImage,

            );
          },
          itemCount: 2,
          pagination:  SwiperPagination(
          ),
          autoplay: true,
        ),
      ),
    );
  }
}
