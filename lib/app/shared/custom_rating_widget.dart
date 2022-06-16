import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';

class CustomRatingWidget extends StatelessWidget {
  final bool enable;
  final double? initialRating;
  final int? maxRating;
  final double? size;
  final Function? onRatingUpdate;
  CustomRatingWidget({this.onRatingUpdate,this.enable =true,required this.initialRating, this.maxRating,
    this.size});
  @override
  Widget build(BuildContext context) {
    return RatingBar(onRatingUpdate: (val){
      if(onRatingUpdate!=null){
        onRatingUpdate!(val);
      }
    },
      ignoreGestures: !enable,itemCount: maxRating??5,
      initialRating: initialRating??0,
      allowHalfRating: true,
      itemSize: size??SizeConfig.screenHeight*.015,
      glowColor: AppColors.yellow,

      ratingWidget: RatingWidget(
        full: Icon(Icons.star,color: AppColors.red,),
    half: Icon(Icons.star_half,color: AppColors.red,),
    empty:Icon(Icons.star_border)
    ),
    );
  }
}
