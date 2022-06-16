import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/hellow_city_icon.dart';
import 'package:hellowcity/app/data/size_config.dart';


class CustomQuantityWidget extends StatelessWidget {
  final int quantity;
  final Function? onIncrease,onDecrease;
  CustomQuantityWidget({Key? key,required this.quantity,this.onDecrease,this.onIncrease}) : super(key: key);


  Widget _circularWidget(IconData icon,Color color){
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color

      ),
      child: Center(
        child: Icon(icon,color: AppColors.whiteColor,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(child: _circularWidget(HellowCityIcons.minus,quantity>1?AppColors.black:
          AppColors.darkGrayColor),
          onTap: (){
           if(onDecrease!=null)onDecrease!();
          },),
          SizedBox(
            width: SizeConfig.screenWidth*.1,
            child: Center(child: Text('$quantity')),
          ),
          InkWell(child: _circularWidget(HellowCityIcons.plus,AppColors.primaryColor),
          onTap: (){
            if(onIncrease!=null)onIncrease!();
          },)
        ],
      ),
    );
  }
}
