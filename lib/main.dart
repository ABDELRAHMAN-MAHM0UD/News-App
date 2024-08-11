import 'package:flutter/material.dart';
import 'package:news/Home%20Page/Home_Screen.dart';
import 'package:news/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
     /* localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],*/
/*      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],*/
    locale: Locale('en'),
    debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => HomeScreen()
      },
      initialRoute: HomeScreen.routName,
      theme:Mytheme.appTheme ,
    );
  }
}
