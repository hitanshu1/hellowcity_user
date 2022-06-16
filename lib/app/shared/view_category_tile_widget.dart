import 'package:flutter/material.dart';
import 'package:hellowcity/app/model/category.dart';

import 'custom_small_tile_widget.dart';


class ViewCategoryTileWidget extends StatelessWidget {
  final CategoryModel category;
  final Function? onTap;
  ViewCategoryTileWidget({Key? key,required this.category,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSmallTileWidget(
          onTap: (){
            if(onTap!=null) {
              onTap!();
            }
          },
          imageUrl: category.imageUrl,
          isAssetsImage: true,
          title: category.name,

        ),
      ],
    );
   
  }
}
