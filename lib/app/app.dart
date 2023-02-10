import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/navigation/app_router/app_router.dart';
import 'package:poc/widgets/responsive_layout_builder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fr"),
        Locale("en"),
      ],
      builder: (context, child) => ResponsiveLayoutBuilder(
        small: (context, child) => child!,
        large: (context, child) => child!,
        child: child,
      ),
      routerConfig: AppRouter.routerConfig(),
    );
  }
}
