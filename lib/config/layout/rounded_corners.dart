import 'package:flutter/material.dart';

class RoundedCorners {
  const RoundedCorners({this.radius = 8});
  final double radius;

  ShapeBorder? shape() => ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        0.5,
      );
}
