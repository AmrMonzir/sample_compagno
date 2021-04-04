import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_compagno/utils/constants.dart';

class SearchWidget extends StatelessWidget {
  final onSubmitted;

  const SearchWidget({required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333.w,
      child: TextField(
        onSubmitted: (value) => onSubmitted(value),
        decoration: kTextFieldDecoration.copyWith(
            hintText: "Search Food",
            hintStyle: TextStyle(fontSize: 14, color: Color(0xffB6B7B7)),
            prefixIcon: Wrap(runAlignment: WrapAlignment.center, children: [
              SizedBox(width: 15.w),
              Icon(Icons.search, color: Color(0xff7C7D7E), size: 23.w)
            ])),
      ),
    );
  }
}
