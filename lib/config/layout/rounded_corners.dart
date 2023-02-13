import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedCorners {
  final double radius;

  RoundedCorners({this.radius = 8});

  get shape => ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        0.5,
      );
}
