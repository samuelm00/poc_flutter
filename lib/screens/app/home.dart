import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poc/config/l10n/l10n.dart';
import 'package:poc/features/posts/post_feed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10 = AppLocalizationsX(context).l10n;

    return const Padding(padding: EdgeInsets.all(8.0), child: PostFeed());
  }
}
