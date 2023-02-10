import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:poc/config/layout/breakpoints.dart';

/// Signature for the individual builders (`small`, `large`, etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// {@template responsive_layout_builder}
/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
/// {@endtemplate}
class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.small,
    required this.large,
    this.medium,
    this.xLarge,
    this.child,
  }) : super(key: key);

  final ResponsiveLayoutWidgetBuilder small;

  final ResponsiveLayoutWidgetBuilder? medium;

  final ResponsiveLayoutWidgetBuilder large;

  final ResponsiveLayoutWidgetBuilder? xLarge;

  /// Optional child widget which will be passed
  /// to the `small`, `large` and `xLarge`
  /// builders as a way to share/optimize shared layout.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= AppBreakpoints.small) {
          log(
            'Rendering small layout: '
            '${constraints.maxWidth} <= ${AppBreakpoints.small}',
          );
          return small(context, child);
        }
        if (constraints.maxWidth <= AppBreakpoints.medium) {
          log(
            'Rendering medium layout: '
            '${constraints.maxWidth} <= ${AppBreakpoints.medium}',
          );
          return (medium ?? large).call(context, child);
        }
        if (constraints.maxWidth <= AppBreakpoints.large) {
          log(
            'Rendering large layout: '
            '${constraints.maxWidth} <= ${AppBreakpoints.large}',
          );
          return large(context, child);
        }
        return (xLarge ?? large).call(context, child);
      },
    );
  }
}
