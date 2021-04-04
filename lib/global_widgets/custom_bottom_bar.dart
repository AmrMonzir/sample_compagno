import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  Map<int, bool> indexSelected = {
    0: false,
    1: false,
    2: true,
    3: false,
    4: false,
  };

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      // buttonBackgroundColor: Color(0xffB6B7B7),
      index: 2,
      items: [
        BottomBarItem(
          icon: Icon(FontAwesomeIcons.thLarge,
              size: 22,
              color: indexSelected[0]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
          label: "Menu",
          selected: indexSelected[0]!,
        ),
        BottomBarItem(
          icon: Image.asset("assets/images/shop_icon.png",
              height: 25.h,
              color: indexSelected[1]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
          label: "Shop",
          selected: indexSelected[1]!,
        ),
        BottomBarItem(
          icon: Icon(Icons.home,
              size: 30,
              color: indexSelected[2]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
          label: "Home",
          selected: indexSelected[2]!,
        ),
        BottomBarItem(
          icon: Image.asset("assets/images/wallet.png",
              height: 22.h,
              color: indexSelected[3]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
          label: "Wallet",
          selected: indexSelected[3]!,
        ),
        BottomBarItem(
          icon: Image.asset("assets/images/account.png",
              height: 23.h,
              color: indexSelected[4]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
          label: "Account",
          selected: indexSelected[4]!,
        ),
      ],
      onTap: (index) => updateMap(index),
    );
  }

  void updateMap(index) {
    for (int i = 0; i < indexSelected.keys.length; i++) {
      setState(() {
        indexSelected[i] = false;
      });
    }
    setState(() {
      indexSelected[index] = true;
    });
  }
}

class BottomBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final bool selected;
  const BottomBarItem(
      {required this.icon, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: selected ? EdgeInsets.all(8.0) : EdgeInsets.zero,
          child: icon,
        ),
        !selected
            ? Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: selected ? Color(0xffCD242E) : Color(0xffC4C3C3),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
