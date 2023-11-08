import 'dart:math';

import 'package:flutter/material.dart';

class MyTiger extends StatelessWidget {
  const MyTiger({
    super.key,
    required this.tigerSprintCount,
    required this.tigerDirection,
  });

  final int tigerSprintCount;
  final String tigerDirection;

  @override
  Widget build(BuildContext context) {
    if (tigerDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('lib/images/tiger1.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('lib/images/tiger1.png'),
        ),
      );
    }
  }
}
