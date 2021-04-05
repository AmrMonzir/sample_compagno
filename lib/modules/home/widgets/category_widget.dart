import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String imgUrl;
  final Widget trailing;
  final double totalHeight;
  final double totalWidth;
  final LinearGradient gradient;

  const CategoryWidget(
      {required this.imgUrl,
      required this.trailing,
      required this.totalHeight,
      required this.totalWidth,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: totalHeight,
      width: totalWidth,
      child: Stack(
        children: [
          //Gradient layer fills the whole widget
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffBABABA))),
          )),
          //Picture placing with white border
          Positioned(
            child: Container(
              width: totalWidth,
              height: (totalHeight * 97.h / 130.h),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(imgUrl)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white, width: 4)),
            ),
          ),
          Positioned(
            child: Container(
                height: totalHeight + 8.h - ((totalHeight * 97.h) / 130.h),
                width: totalWidth,
                child: Center(child: trailing)),
            right: 0,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
