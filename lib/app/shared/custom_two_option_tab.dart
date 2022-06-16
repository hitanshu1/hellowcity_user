import 'package:flutter/material.dart';
import 'package:hellowcity/app/data/app_colors.dart';
import 'package:hellowcity/app/data/size_config.dart';
import 'package:hellowcity/app/data/text_style.dart';


class CustomTwoOptionWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool value;
  final String firstText,secondText;

  CustomTwoOptionWidget({
    required this.onChanged,required this.value,required this.secondText,required this.firstText

  }) : super();

  @override
  _CustomTwoOptionWidgetState createState() => _CustomTwoOptionWidgetState();
}

class _CustomTwoOptionWidgetState extends State<CustomTwoOptionWidget>with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? animation;
  Animation? _colorTween;
  Animation? _colorTweenTwo;
  double value = 0.0;

  bool turnState=false;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 400));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    animationController?.addListener(() {
      setState(() {
        value = animation!.value;
      });
    });

    turnState = widget.value;
    _determine();
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(animationController!);
    _colorTweenTwo=ColorTween(begin: Colors.black, end: Colors.white)
        .animate(animationController!);
  }
//  _action() {
//    _determine(changeState: true);
//  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController?.forward()
          : animationController?.reverse();
      if (changeState) widget.onChanged(turnState);
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onHorizontalDragUpdate: (details){
          if((details.primaryDelta??0)>0){

            animationController?.forward();

            turnState=false;
            setState(() {

            });
            widget.onChanged(true);
          }else{


            animationController?.reverse();

            turnState=true;
            setState(() {

            });
            widget.onChanged(false);
          }

        },
        child: Container(
          height: SizeConfig.screenHeight*.07,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(SizeConfig.radiusSmall)),
          padding: EdgeInsets.all(2),
          child: Stack(children: <Widget>[
            Transform.translate(
//                offset: Offset(((SizeConfig.screenWidth * 0.5) * value - (2 * value)),0),
                offset: Offset(((SizeConfig.screenWidth * 0.5-SizeConfig.sidePadding.left+2) * value - (2 * value)), 0),
                child: Container(
                  height:SizeConfig.screenHeight*.07,
//                  width: SizeConfig.screenWidth * 0.5-(SizeConfig.sidepadding.left*2) ,
                  width: SizeConfig.screenWidth * 0.5-(SizeConfig.sidePadding.left) ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.radiusSmall),
                      gradient: AppColors.primaryLinearGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20.0,
                        ),
                      ]),
                )),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      animationController?.reverse();
                      widget.onChanged(false);
                      turnState=true;
                      setState(() {

                      });
//                      _action();
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon(widget.value?StoreangelIcons.banana_apple:StoreangelIcons.grocery_list,color:_colorTween.value,),
                          SizeConfig.horizontalSpaceSmall(),
                          Text(widget.firstText,
                            textAlign: TextAlign.center,
                            style: widget.value?AppStyles.mediumTextStyle.copyWith(
                                color: _colorTween?.value
                            ):AppStyles.mediumTextStyle.copyWith(
                                color: _colorTween?.value
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      animationController?.forward();
                      widget.onChanged(true);
                      turnState=false;
                      setState(() {

                      });
//                      _action();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(widget.secondText,
                          textAlign: TextAlign.center,
                          style: widget.value?AppStyles.mediumTextStyle.copyWith(
                              color: _colorTweenTwo?.value
                          ):AppStyles.mediumTextStyle.copyWith(
                              color: _colorTweenTwo?.value
                          ),),
                        SizeConfig.horizontalSpaceSmall(),
                        // Icon( widget.value?StoreangelIcons.chat_full:StoreangelIcons.chat,color:_colorTweenTwo.value,),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

}
