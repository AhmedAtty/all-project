import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/language_provider.dart';
import 'package:smm_app/screens/splash_screen.dart';
import 'package:smm_app/utils/app_colors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late LanguageProvider _languageProvider;

  @override
  void didChangeDependencies() {
    _languageProvider = Provider.of<LanguageProvider>(context);
    _languageProvider.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _languageProvider.locale.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _languageProvider.locale,
        theme: ThemeData(
            textTheme: GoogleFonts.cairoTextTheme(),
            primarySwatch: AppColors.primarySwatch),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
