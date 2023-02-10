import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/navigation/app_router/app_router.dart';
import 'package:poc/widgets/responsive_layout_builder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => AppFragment(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
      medium: (_, child) => AppFragment(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
      large: (_, child) => AppFragment(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      ),
    );
  }
}

class AppFragment extends StatelessWidget {
  const AppFragment({super.key, this.theme, this.sharedLayoutBuilder});

  final ResponsiveLayoutWidgetBuilder? sharedLayoutBuilder;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
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
      routerConfig: AppRouter.routerConfig(),
      builder: (context, child) {
        if (child == null) {
          return const Placeholder();
        }
        return sharedLayoutBuilder?.call(context, child) ?? child;
      },
    );
  }
}
