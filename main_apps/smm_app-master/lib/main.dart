import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/app.dart';
import 'package:smm_app/providers/auth_provider.dart';
import 'package:smm_app/providers/forgot_password_provider.dart';
import 'package:smm_app/providers/home_provider.dart';
import 'package:smm_app/providers/language_provider.dart';
import 'package:smm_app/providers/my_account_provider.dart';
import 'package:smm_app/providers/orders_provider.dart';
import 'package:smm_app/providers/pages_provider.dart';
import 'package:smm_app/providers/payment_provider.dart';
import 'package:smm_app/providers/services_provider.dart';
import 'package:smm_app/providers/support_provider.dart';
import 'package:smm_app/utils/preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ServicesProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => MyAccountProvider()),
        ChangeNotifierProvider(create: (context) => SupportProvider()),
        ChangeNotifierProvider(create: (context) => OrdersProvider()),
        ChangeNotifierProvider(create: (context) => PagesProvider()),
      ],
      child: const App(),
    ),
  );
}
