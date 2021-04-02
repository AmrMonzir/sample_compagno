import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color kBaseShimmerColor = Colors.grey[300]!;
Color kHighlightShimmerColor = Colors.grey[100]!;
Color kPrimaryColor = Color(0xffCD242E);
var kTextFieldDecoration = InputDecoration(
    filled: true,
    hintText: "Hint Text",
    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
    fillColor: Color(0xffF2F2F2),
    contentPadding: EdgeInsets.only(left: 34.w, top: 22.h, bottom: 22.h));
const kButtonTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
const Color kSuccessfulSnackBar = Color(0xff98EE99);
const Color kFailedSnackBar = Color(0xffe53953);
