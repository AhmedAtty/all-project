import 'package:flutter/material.dart';
import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:sex_smart/recources/color_managr.dart';

import 'package:provider/provider.dart';

class CardInkwel extends StatelessWidget {
  GestureTapCallback ontap;
  String text;
  var icons;
  CardInkwel(this.text,this.icons,this.ontap);

  @override
  Widget build(BuildContext context) {
    BottomProvedr dark=Provider.of<BottomProvedr>(context);
    return  InkWell(
      borderRadius: BorderRadius.circular(13),

      onTap:ontap,
      child: Container(
        height: 120,
        width: 110,
        child: Card(
          color: dark.isdark?ColorManager.white:ColorManager.app,
          child: Column(
            children: [
              Icon(icons,size: 60,),

              SizedBox(height: 10,),
              Text(text,style: Theme.of(context).textTheme.bodyLarge!.
              copyWith(
                fontSize: 10
              ),),


            ],

          ),
        ),
      ),
    );
  }
}
