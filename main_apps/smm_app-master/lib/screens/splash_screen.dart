import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/screens/auth_screen.dart';
import 'package:smm_app/screens/home_screen.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/utils/preferences_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final hasToken = PreferencesManager.hasKey(PreferencesManager.token);
      log('Has Token => $hasToken: ${PreferencesManager.getString(PreferencesManager.token)}');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PreferencesManager.hasKey(PreferencesManager.token)
                    ? const HomeScreen()
                    : const AuthScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Spacer(),
            Text(
              S.of(context).dsm,
              style: AppStyles.bold(
                  fontSize: 65, color: Theme.of(context).primaryColor),
            ),
            Text(
              S.of(context).dsmMarketing,
              style: AppStyles.bold(
                  fontSize: 26, color: Theme.of(context).primaryColor),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
