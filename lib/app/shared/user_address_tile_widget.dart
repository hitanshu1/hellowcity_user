import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/model/address_model.dart';

import 'custom_card.dart';

class UserAddressTileWidget extends StatelessWidget {
  final AddressModel address;
  final Function? onEdit,onTap;
   UserAddressTileWidget({Key? key,required this.address,this.onTap,this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: CustomCard(
        child: Padding(
          padding: SizeConfig.padding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(address.defaultAddress?Icons.radio_button_checked:
              Icons.radio_button_off_outlined,color: address.defaultAddress?AppColors.primaryColor:
                AppColors.darkGrayColor,),
              SizeConfig.horizontalSpaceSmall(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name??'',style: AppStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.w700
                    ),),
                    Text(address.phone??'',style: AppStyles.smallerTextStyle,),
                    Text(address.fullAddress,style: AppStyles.smallerTextStyle)
                  ],
                ),
              ),
              IconButton(onPressed: (){
                if(onEdit!=null){
                  onEdit!();
                }
              }, icon: Icon(Icons.edit,color: AppColors.primaryColor,))
            ],
          ),
        ),
      ),
    );
  }
}
