import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_compagno/data/model/product.dart';

class CategoryNameRatingTrailingWidget extends StatelessWidget {
  final Product product;

  const CategoryNameRatingTrailingWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 9, 17, 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            child: Text(product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                )),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: _prepareStars(product),
                  ),
                  SizedBox(height: 1.5.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text("${product.reviews.totalRating} Star Ratings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w500)),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Text("${product.formatedPrice}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w700)),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _prepareStars(Product product) {
    List<Widget> list = [];
    for (int i = 0; i < product.reviews.totalRating; i++) {
      list.add(Icon(Icons.star, color: Colors.white, size: 8.w));
    }
    for (int i = 5; i > product.reviews.totalRating; i--) {
      list.add(Icon(Icons.star_border, size: 8.w));
    }
    return list;
  }
}
