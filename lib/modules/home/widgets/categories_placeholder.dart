import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_compagno/global_widgets/shimmer_container.dart';
import 'package:sample_compagno/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesPlaceholder extends StatelessWidget {
  const CategoriesPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Column(
          children: [
            SizedBox(height: 11.h),
            Row(
              children: [
                SizedBox(width: 10.w),
                ShimmerContainer(
                    width: 107.w, height: 130.h, borderRadius: 10, margin: 10),
                ShimmerContainer(
                    width: 107.w, height: 130.h, borderRadius: 10, margin: 10),
                ShimmerContainer(
                    width: 107.w, height: 130.h, borderRadius: 10, margin: 10),
              ],
            ),
          ],
        ),
        baseColor: kBaseShimmerColor,
        highlightColor: kHighlightShimmerColor);
  }
}
