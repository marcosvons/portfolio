import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/theme_manager.dart';
import 'package:portfolio/features/features.dart';
import 'package:portfolio/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
