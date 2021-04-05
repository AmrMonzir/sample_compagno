import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_compagno/global_widgets/shimmer_container.dart';
import 'package:sample_compagno/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class NearestCategoriesPlaceholder extends StatelessWidget {
  const NearestCategoriesPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          children: [
            SizedBox(height: 11.h),
            Container(
              height: 200.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  ShimmerContainer(
                      width: 162.w, height: 197.h, borderRadius: 10, margin: 1),
                  ShimmerContainer(
                      width: 162.w, height: 197.h, borderRadius: 10, margin: 1),
                  ShimmerContainer(
                      width: 162.w, height: 197.h, borderRadius: 10, margin: 1),
                ],
              ),
            ),
          ],
        ),
        baseColor: kBaseShimmerColor,
        highlightColor: kHighlightShimmerColor);
  }
}
