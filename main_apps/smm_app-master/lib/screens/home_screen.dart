import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/home_provider.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/utils/preferences_manager.dart';
import 'package:smm_app/widgets/app_drawer.dart';
import 'package:smm_app/widgets/category_widget.dart';
import 'package:smm_app/widgets/offers_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider _homeProvider;

  @override
  void didChangeDependencies() async {
    _homeProvider = Provider.of<HomeProvider>(context);
    await _homeProvider.getCategories(context);
    await _homeProvider.getOffers(context);
    _homeProvider.getUserProfile(context);
    log('Offers Count -> ${_homeProvider.offers.length}');
    log('Token -> ${PreferencesManager.getString(PreferencesManager.token)}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).dsmMarketing),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            OffersWidget(offers: _homeProvider.offers),
            const SizedBox(
              height: 16,
            ),
            Text(
              S.of(context).categories,
              style: AppStyles.bold(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 142),
                  itemCount: _homeProvider.categories.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                        category: _homeProvider.categories[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
