import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gold_hub/core/constants/app_constants.dart';
import 'package:gold_hub/core/utils/app_routers.dart';
import 'package:gold_hub/generated/l10n.dart';

void main() {
  runApp(GoldenHub());
}

class GoldenHub extends StatelessWidget {
  const GoldenHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routers,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: AppConstants.cairoFontFamily,
      ),
      locale: Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
