import 'package:poc/app/app.dart';
import 'package:poc/config/config.dart';
import 'package:poc/bootstrap.dart';
import 'package:flutter/material.dart';

const buildFlavor = BuildFlavor.production;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}
