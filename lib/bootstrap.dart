import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:poc/config/build_flavor/build_flavor.dart';
import 'package:poc/config/get_it/get_it.dart';

Future<void> bootstrap(
    FutureOr<Widget> Function() builder, BuildFlavor flavor) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  setupDependencies(flavor);

  runApp(await builder());
}
