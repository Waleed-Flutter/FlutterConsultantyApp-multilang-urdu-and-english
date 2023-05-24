import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_arb_example/example/sorce3.dart';
import 'package:localization_arb_example/example/sorce5.dart';
import 'package:localization_arb_example/example/sorce6.dart';
import 'package:localization_arb_example/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_arb_example/page/Ourservice.dart';
import 'package:localization_arb_example/page/splashscreen.dart';
import 'package:localization_arb_example/provider/langchange.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String label = 'language';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
        create: (context) => LanguageChangeProvider(),
        child: Builder(
            builder: (context) => MaterialApp(
                home: SplashScreen(),
                debugShowCheckedModeBanner: false,
                title: label,
                locale:
                    Provider.of<LanguageChangeProvider>(context, listen: true)
                        .currentLocale,
                supportedLocales: L10n.all,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                builder: (context, navigator) {
                  var lang = Localizations.localeOf(context).languageCode;

                  return Theme(
                    data: ThemeData(
                      fontFamily: lang == 'ar' ? 'Tajawal' : 'Tajawal',
                      scaffoldBackgroundColor: Colors.white,
                      primaryColor: Colors.deepPurpleAccent,
                      textTheme: const TextTheme(
                        headline1: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff999999)),
                        headline2: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        headline3: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        headline4: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        bodyText2: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff2A5B74),
                        ),
                      ),
                    ),
                    child: navigator,
                  );
                })));
  }
}
