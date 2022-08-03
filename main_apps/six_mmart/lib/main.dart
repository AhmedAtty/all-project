import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sex_smart/pages/bottom_nav/bottom_navgtion.dart';
import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:sex_smart/provider/provider_catgory/provider_catgory.dart';
import 'package:sex_smart/provider/provider_home/provider_home.dart';

import 'component/components.dart';
import 'helper/dio_helper.dart';
import 'local/cash_hlper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cash_Hlper.init();
  bool? isDark = Cash_Hlper.getBoolean(key: 'isDark');
  DioHelper.init();
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (_) => HomeViewModel()..getProduct()),
        ChangeNotifierProvider<ProviderCatgory>(
            create: (_) => ProviderCatgory()..getCatgory()),
        ChangeNotifierProvider(
          create: (context) => BottomProvedr()..checkisdark(fromshard: isDark),
        ),
      ],
      child: Consumer<BottomProvedr>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: tehemdata(),
            darkTheme: darkTheme(),
            debugShowCheckedModeBanner: false,
            themeMode: value.isdark ? ThemeMode.light : ThemeMode.dark,
            home: BottomNavgtion(),
          );
        },
      ),
    );
  }
}
