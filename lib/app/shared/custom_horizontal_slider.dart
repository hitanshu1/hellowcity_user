import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomHorizontalSlider extends StatelessWidget {
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  const CustomHorizontalSlider({Key? key,required this.itemBuilder,required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            height: 150,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
            }
        ),
        itemCount: itemCount>0?itemCount:0,
        itemBuilder:itemCount>0?itemBuilder:  (context,int index,int lastIndex) {

          return Container();
        });
  }
}
