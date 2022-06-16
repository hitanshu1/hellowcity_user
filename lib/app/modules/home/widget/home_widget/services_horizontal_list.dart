import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/appdata.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/shared/view_category_tile_widget.dart';

class ServicesHorizontalList extends StatelessWidget {
  const ServicesHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.smallTileHeight,
      child: ListView.builder(itemCount: AppData.servicesList.length,scrollDirection: Axis.horizontal,
          itemBuilder: (context,int index){

            return Padding(
              padding:  EdgeInsets.only(right: index==AppData.servicesList.length-1?0:10),
              child: ViewCategoryTileWidget(category: AppData.servicesList[index],
                onTap: (){
                  // Navigator.of(context).pushNamed(ServiceDetailsScreen.routeName,
                  //     arguments:AppData.serviceslist[index] );
                },),
            );
          }),
    );
  }
}
