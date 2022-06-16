import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_assets.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/hellow_city_icon.dart';
import 'package:hellowcity/app/model/product_item_model.dart';
import 'package:hellowcity/app/shared/custom_slider_images_widget.dart';


class ItemDetailsAppBarWidget extends StatelessWidget {
     final ProductItemModel? item;
     final Function onClickHeart;
     ItemDetailsAppBarWidget({Key? key, this.item,required this.onClickHeart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        CustomSliderImageWidget(
          emptyImageUrl: AppAssets.defaultFoodAsset,
          images:(item?.imageList?.length??0)>0?item?.imageList:null,
        ),
        Positioned.fill(child:
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.black.withOpacity(.2),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30,
                  bottom: 10
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_back_ios,color: AppColors.whiteColor,), onPressed: (){
                    Navigator.pop(context);
                  }),
                  Spacer(),
                  if(item?.deliveryStatus??false)IconButton(icon: Container(
                    height: 100,
                    width: 100,
                    child: Icon(HellowCityIcons.heart_empty,),
                    decoration: BoxDecoration(
                        color: (item?.isWishList??false)?AppColors.red:AppColors.whiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [ BoxShadow(
                          color: Colors.black,
                          blurRadius: 10.0,
                        ),]
                    ),), onPressed: (){
                    onClickHeart();
                  },)
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
