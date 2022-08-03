import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/pages/screenbottom/setting_screen.dart';

import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:sex_smart/provider/provider_home/provider_home.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/map_card/card_map.dart';
import 'package:provider/provider.dart';

class BottomNavgtion extends StatefulWidget {
  @override
  State<BottomNavgtion> createState() => _BottomNavgtionState();
}

class _BottomNavgtionState extends State<BottomNavgtion> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomProvedr>(
      builder: (BuildContext context, value, Widget? child) {
        Provider.of<HomeViewModel>(context).getProduct();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: value.currentAddress == null
                ? Text('No Loction Data')
                : Text(value.currentAddress!,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                  onPressed: () {
                    navgiTo(context, CardGetMap());
                  },
                  icon: Icon(
                    Icons.location_pin,
                    color: Colors.amber,
                    size: 35,
                  ))
            ],
          ),
          body: value.listScreen[value.curintIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: value.curintIndex,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.amber,
            color: value.isdark ? Colors.grey.withOpacity(.3) : Colors.indigo,
            height: 55,
            items: value.lisBottom,
            onTap: (index) {
              //Handle button tap
              if (index<3) {
                value.ChingIndex(index);
              } else {
                showModalBottomSheet(context: context,
                    builder: (context)=>Show());
              }
            },
          ),
        );
      },
    );
  }
}
