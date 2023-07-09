import 'package:first_app/provider/surahs_provider.dart';
import 'package:first_app/screens/spliash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.locale});
  final Locale? locale;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SurahProvider>(
            create: (context) => SurahProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.cairo().fontFamily),
        home: SplashScreen(),
        // const HomeScrean(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'), // Ar
          Locale('en'), // English
        ],
      ),
    );
  }
}
