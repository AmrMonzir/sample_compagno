import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String imgUrl;

  const CategoryWidget({required this.name, required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 107.w,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: Alignment(0.5, 0.956),
                  end: Alignment(0.5, -1),
                  colors: [
                    Color(0xffCD242E),
                    Color(0xffFF8F96),
                    Color(0xffCD242E),
                  ],
                  stops: [0, 0.5, 1],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffBABABA))),
          )),
          Positioned(
              child: Column(
            children: [
              Container(
                height: 97.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 9, 16, 0),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 11.sp),
                  ),
                ),
              )
            ],
          )),
          Positioned(
            top: 3,
            right: 3,
            child: Container(
              width: 101.w,
              height: 90.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(Icons.error)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
