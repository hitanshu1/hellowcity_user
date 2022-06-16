import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomMenuItemWidget extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final bool isActive;
  const CustomMenuItemWidget({Key? key,this.onTap,this.title,this.isActive:false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: Padding(
        padding: SizeConfig.smallPadding,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Column(
            children: [
              Text(title??'',
                style:AppStyles.smallTextStyle.copyWith(
                  color:  Colors.deepPurple,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 6,
              ),
              isActive
                  ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
              )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
