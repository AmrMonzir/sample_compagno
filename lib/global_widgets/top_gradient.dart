import 'package:flutter/material.dart';

class TopGradient extends StatelessWidget {
  const TopGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.128, 0.77),
              end: Alignment(0.31, -1.3),
              colors: [
                Colors.white.withOpacity(0),
                Color(0xff659CB5).withOpacity(0.6),
                Color(0xff5994AF).withOpacity(0.8),
                Color(0xff076188).withOpacity(0.8),
              ],
              stops: [0, 0.45, 0.6, 1],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}
