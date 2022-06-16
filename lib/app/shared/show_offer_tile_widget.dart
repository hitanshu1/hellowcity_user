import 'package:flutter/material.dart';
import 'package:hellowcity/app/shared/view_app_image.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'custom_offer_tile_shape.dart';


class ShowOfferTileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomTileShape(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizeConfig.verticalSpaceMedium(),
                  Text('Bakery',style: AppStyles.mediumTextStyle.copyWith(
                    color: AppColors.green
                  ),),
                  Row(
                    children: [
                      Text('Order Now',style: AppStyles.smallerTextStyle.copyWith(
                        color: AppColors.black
                      ),),
                      SizeConfig.horizontalSpaceSmall(),
                      Icon(Icons.forward)
                    ],
                  ),
                ],
              ),
            ),
            SizeConfig.horizontalSpaceSmall(),
            ViewAppImage(
              radius: 5,
              width: SizeConfig.screenWidth*.3,
              height: 100,
              imageUrl: 'https://images.unsplash.com/photo-1534432182912-63863115e106?ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80',
            )
          ],
        ),
      );
  }
}
