import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 72.w,
        height: 72.w,
        child: new RawMaterialButton(
          fillColor: Color(0xffC4C3C3),
          shape: new CircleBorder(),
          elevation: 0.0,
          child: SvgPicture.asset("assets/images/home.svg",
              color: Colors.white, width: 30.w),
          onPressed: () {
            //TODO go to home page
          },
        ),
      ),
    );
  }
}
