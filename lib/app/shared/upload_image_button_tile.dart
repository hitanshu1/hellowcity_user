import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/text_style.dart';
import 'package:hellowcity/app/shared/platformalertDialog.dart';
import 'package:permission_handler/permission_handler.dart';
class UploadImageButtonTile extends StatelessWidget {
  final Function clickCamera,clickGallery;
  final String? title;
   UploadImageButtonTile({Key? key,required this.clickCamera,required this.clickGallery,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PlatformAlertDialog(
          barrierDismissible: true,
          title: AppString.getYourImage.tr,
          content: '\n${AppString.selectWhichImageOptionYouWantToChoose.tr}\n',
          defaultActionText: AppString.openGalleryOption.tr,
          defaultFunction: ()async{
            final status=await Permission.photos.status;
            print('status=$status');
            if (await Permission.photos.isPermanentlyDenied) {
              // The user opted to never again see the permission request dialog for this
              // app. The only way to change the permission's status now is to let the
              // user manually enable it in the system settings.
              openAppSettings();
            }else
            if (await Permission.photos.isDenied) {
              // The user opted to never again see the permission request dialog for this
              // app. The only way to change the permission's status now is to let the
              // user manually enable it in the system settings.
              try{
                print('error1');
                clickGallery();
              }catch(e){
                print('error');
                openAppSettings();
              }

            }else{


            clickGallery();}
            Navigator.pop(context);
          },
          defaultActionText2: AppString.openCameraOption.tr,
          defaultFunction2: (){
           clickCamera();
           Navigator.pop(context);
          },
        ).show(context);

      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title??'',style: AppStyles.largeTextStyle.copyWith(
              fontWeight: FontWeight.bold,color: AppColors.primaryColor
            ),),
            Icon(Icons.add_a_photo,color: AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}
