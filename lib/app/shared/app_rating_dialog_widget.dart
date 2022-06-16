import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/shared/app_dialog_shape.dart';
import 'package:hellowcity/app/shared/custom_button_widget.dart';

import 'custom_rating_widget.dart';

class AppRatingDialogWidget extends StatefulWidget {
  final double initialRating;
  final Function onSubmitRating;

  const AppRatingDialogWidget({Key? key,required this.initialRating,required this.onSubmitRating}) : super(key: key);

  @override
  State<AppRatingDialogWidget> createState() => _AppRatingDialogWidgetState();
}

class _AppRatingDialogWidgetState extends State<AppRatingDialogWidget> {

  double rating=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rating=widget.initialRating;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return AppDialogShape(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppString.rateNow.tr,style: AppStyles.mediumTextStyle.copyWith(
            fontWeight: FontWeight.w700,color: AppColors.primaryColor
          ),),
          SizeConfig.verticalSpaceLarge(),
          CustomRatingWidget(
            size: SizeConfig.screenHeight*.06,
            initialRating: widget.initialRating, enable: true  ,
          onRatingUpdate: (val){
              rating=val;
              setState(() {

              });
          },),
          SizeConfig.verticalSpaceMedium(),

          Padding(
            padding:SizeConfig.sidePadding,
            child: CustomButtonWidget(onPressed: (){
              widget.onSubmitRating(rating);

            },buttonText: AppString.submit.tr,
            width: SizeConfig.screenWidth*.5,),
          ),
          SizeConfig.verticalSpaceLarge(),
        ],
      ),
    );
  }
}
