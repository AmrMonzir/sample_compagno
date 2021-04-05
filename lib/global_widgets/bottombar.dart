import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Map<int, bool> indexSelected = {};

  @override
  void initState() {
    indexSelected[0] = true;
    indexSelected[1] = false;
    indexSelected[2] = false;
    indexSelected[3] = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      elevation: 5,
      child: Row(
        children: <Widget>[
          SizedBox(width: 13.w),
          BottomBarItem(
            icon: Icon(FontAwesomeIcons.thLarge,
                size: 22,
                color:
                    indexSelected[0]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
            label: "Menu",
            onPress: () {
              updateMap(0);
            },
            isSelected: indexSelected[0]!,
          ),
          SizedBox(width: 40.w),
          BottomBarItem(
            icon: Image.asset("assets/images/shop_icon.png",
                height: 25.h,
                color:
                    indexSelected[1]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
            label: "Shop",
            onPress: () {
              updateMap(1);
            },
            isSelected: indexSelected[1]!,
          ),
          const Spacer(),
          BottomBarItem(
            icon: Image.asset("assets/images/wallet.png",
                height: 22.h,
                color:
                    indexSelected[2]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
            label: "Wallet",
            onPress: () {
              updateMap(2);
            },
            isSelected: indexSelected[2]!,
          ),
          SizedBox(width: 30.w),
          BottomBarItem(
            icon: Image.asset("assets/images/account.png",
                height: 22.h,
                color:
                    indexSelected[3]! ? Color(0xffCD242E) : Color(0xffC4C3C3)),
            label: "Account",
            onPress: () {
              updateMap(3);
            },
            isSelected: indexSelected[3]!,
          ),
          SizedBox(width: 13.w),
        ],
      ),
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
  final String label;
  final Widget icon;
  final onPress;
  final bool isSelected;

  const BottomBarItem({
    required this.label,
    required this.icon,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 33.w),
            icon,
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected ? Color(0xffCD242E) : Color(0xffC4C3C3),
              ),
            ),
            SizedBox(width: 28.w),
          ],
        ),
      ),
    );
  }
}
