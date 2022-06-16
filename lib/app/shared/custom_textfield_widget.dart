import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/app_string.dart';
import 'package:hellowcity/app/data/enum/device_type.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String ?titleText;
  final TextStyle? hintTextStyle,titleTextStyle;
  final double? height;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final double? radius;
  final bool obscureText;
  final bool autoCorrect;
  final Function? onSubmit, onChanged;
  final Key? key;
  final bool enabled;
  final String? labelText;
  final Function? onTap;
  final Widget? suffixWidget;
  final int ? maxLines;
  final bool autoValidation;
  final FormFieldValidator? validator;
  final bool isMandatory;


  CustomTextFieldWidget(
      {this.hintText,
        this.validator,
        this.titleText,
        this.autoValidation:false,
        this.hintTextStyle,
        this.titleTextStyle,
        this.height,
        this.controller,
        this.focusNode,
        this.maxLines,
        this.isMandatory:false,
        this.nextFocusNode,
        this.radius,
        this.obscureText: false,
        this.inputFormatters,
        this.textInputAction,
        this.keyboardType,
        this.onSubmit,
        this.key,
        this.onTap,
        this.autoCorrect:true,this.enabled:true,this.labelText,this.onChanged,this.suffixWidget});

  List<TextInputFormatter> get _formatter{
    if(keyboardType==TextInputType.phone){
      if(inputFormatters!=null){
        inputFormatters!.addAll([FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],);
        return inputFormatters??[];
      }else{
       return [LengthLimitingTextInputFormatter(10),FilteringTextInputFormatter.digitsOnly];
      }

    }else if(hintText==AppString.pincode.tr){
      if(inputFormatters!=null){
        inputFormatters!.addAll([FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(6)],);
        return inputFormatters??[];
      }else{
        return [LengthLimitingTextInputFormatter(6),FilteringTextInputFormatter.digitsOnly];
      }
    }else if(hintText==AppString.discount.tr){
      if(inputFormatters!=null){
        inputFormatters!.addAll([FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(2)],);
        return inputFormatters??[];
      }else{
        return [LengthLimitingTextInputFormatter(2),FilteringTextInputFormatter.digitsOnly];
      }
    }else if(keyboardType==TextInputType.number){
      if(inputFormatters!=null){
        inputFormatters!.addAll([FilteringTextInputFormatter.digitsOnly,],);
        return inputFormatters??[];
      }else{
        return [FilteringTextInputFormatter.digitsOnly];
      }
    }else{
      return inputFormatters??[];
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText!=null?Padding(
          padding: SizeConfig.innerSidePadding,
          child: Text((titleText??'')+" :",style: titleTextStyle??AppStyles.smallTextStyle.copyWith(
            fontWeight: FontWeight.w700,color: AppColors.primaryColor
          ),),
        ):Container(),
        if( titleText!=null)SizeConfig.verticalSpaceSmall(),

        GestureDetector(
          onTap: (){
            if(focusNode!=null){
              focusNode?.requestFocus();
            }
            if(onTap!=null)onTap!();
          },
          child: Container(
            height: maxLines!=null?(height ?? (SizeConfig.deviceType==DeviceType.tablet?70:45))*maxLines!:(height ?? (SizeConfig.deviceType==DeviceType.tablet?70:50)),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(radius??SizeConfig.borderRadius),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: SizeConfig.innerSidePadding,
              child: TextFormField(
                enabled: enabled,
                textCapitalization: TextCapitalization.words,

                autovalidateMode: autoValidation?AutovalidateMode.always:AutovalidateMode.disabled,
                validator: validator,
                maxLines: obscureText?1:maxLines,
                key: key,
                obscureText: obscureText,
                style: AppStyles.smallTextStyle,
                controller: controller,
                focusNode: focusNode,
                inputFormatters:_formatter,
                keyboardType: keyboardType ?? TextInputType.text,
                textInputAction: textInputAction ?? TextInputAction.done,
                autocorrect: autoCorrect,
                onChanged: (val){
                  if(onChanged!=null) {
                    onChanged!(val);
                  }
                },

                onFieldSubmitted: (term) {
                  FocusScope.of(context).requestFocus(nextFocusNode ?? FocusNode());
                 if( onSubmit!=null) {
                   onSubmit!(term);
                 }
                },
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration.collapsed(hintText:( hintText??'')+'${isMandatory?'**':""}',
                    hintStyle: hintTextStyle??AppStyles.smallTextStyle.copyWith(
                      color: AppColors.darkGrayColor
                    ),).copyWith(isDense: true,
                suffixIcon:suffixWidget ,
                errorStyle: AppStyles.smallerTextStyle.copyWith(
                  color: AppColors.red
                ),
                labelText: labelText,
                labelStyle: AppStyles.smallTextStyle.copyWith(
                    color: AppColors.darkGrayColor
                ),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
