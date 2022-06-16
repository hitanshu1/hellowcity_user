import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/model/api_image_model.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';

class CustomSliderImageWidget extends StatelessWidget {
  final double? height;
  final bool autoPlay;
  final List<ApiImageModel>? images;
  final String? emptyImageUrl;
  final BorderRadius? borderRadius;
   CustomSliderImageWidget({Key? key,this.borderRadius,this.emptyImageUrl,this.autoPlay=false,this.height,required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius??BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(.2),
            blurRadius: 2,spreadRadius: 1)
          ]
        ),
        height: height ?? SizeConfig.screenHeight*.3,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return ViewAppImage(
              emptyAssetUrl: emptyImageUrl,
              height: height ?? SizeConfig.screenHeight*.3,
              width: SizeConfig.screenWidth,
              imageUrl:images!=null?images![index].imageUrl:(emptyImageUrl!=null?null:'https://cdn4.vectorstock.com/i/1000x1000/98/53/special-offer-red-label-vector-22749853.jpg'),

            );
          },
          itemCount:images!=null?images!.length:2,
          pagination:  SwiperPagination(
          ),
          autoplay: autoPlay,
//                  control: new SwiperControl(),
        ),
      ),
    );
  }
}
