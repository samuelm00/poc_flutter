import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:poc/api/api_service.dart';
import 'package:poc/config/build_flavor/build_flavor.dart';

final getIt = GetIt.instance;

void setupDependencies(BuildFlavor flavor) {
  getIt.registerSingleton<ApiService>(ApiService(httpClient: Client()));
  getIt.registerSingleton<BuildFlavor>(flavor);
}

Future<void> bootstrap(
    FutureOr<Widget> Function() builder, BuildFlavor flavor) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  setupDependencies(flavor);

  runApp(await builder());
}
