import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/models/user.dart';
import 'package:smm_app/providers/language_provider.dart';
import 'package:smm_app/screens/info_page_screen.dart';
import 'package:smm_app/screens/my_account_screen.dart';
import 'package:smm_app/screens/my_orders_screen.dart';
import 'package:smm_app/screens/splash_screen.dart';
import 'package:smm_app/screens/support_screen.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/utils/preferences_manager.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late LanguageProvider _languageProvider;
  late User _user;

  @override
  void didChangeDependencies() {
    _languageProvider = Provider.of<LanguageProvider>(context);
    _user = User.fromJson(
        PreferencesManager.load(User().runtimeType) as Map<String, dynamic>);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyAccountScreen(),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: Image.network(
                      _user.image!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${_user.firstName} ${_user.lastName}',
                        style: AppStyles.bold(
                            fontSize: 24, color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).myOrders,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyOrdersScreen(),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).myAccount,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyAccountScreen(),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).support,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SupportScreen(),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).language,
                  style: AppStyles.semiBold(fontSize: 18),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _languageProvider.locale.languageCode.toUpperCase(),
                    style: AppStyles.semiBold(color: AppColors.white),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile(
                            title: Text(
                              'English',
                              style: AppStyles.medium(fontSize: 18),
                            ),
                            dense: true,
                            value: 'en',
                            groupValue: _languageProvider.locale.languageCode,
                            onChanged: (lang) {
                              _languageProvider.changeLocale();
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile(
                            dense: true,
                            value: 'ar',
                            title: Text(
                              'العربية',
                              style: AppStyles.medium(fontSize: 18),
                            ),
                            groupValue: _languageProvider.locale.languageCode,
                            onChanged: (lang) {
                              _languageProvider.changeLocale();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).privacyPolicy,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoPageScreen(id: 2),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).termsConditions,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoPageScreen(id: 3),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              S.of(context).logOut,
              style: AppStyles.semiBold(fontSize: 18),
            ),
            onTap: () {
              PreferencesManager.clearAppData();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SplashScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
