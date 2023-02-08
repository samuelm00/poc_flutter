import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/config/l10n/l10n.dart';
import 'package:poc/navigation/app_router/app_router.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10 = AppLocalizationsX(context).l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(l10.business),
          TextButton(
            onPressed: () {
              context.push(AppRouter.second);
            },
            child: Text("Go to second page"),
          )
        ],
      ),
    );
  }
}
