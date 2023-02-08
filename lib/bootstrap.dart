import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:poc/api/api_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<ApiService>(ApiService(httpClient: Client()));
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  setupDependencies();

  runApp(await builder());
}
