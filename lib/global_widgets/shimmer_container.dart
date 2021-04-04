import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;

  const ShimmerContainer(
      {required this.width, required this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0)),
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 15.0),
    );
  }
}
