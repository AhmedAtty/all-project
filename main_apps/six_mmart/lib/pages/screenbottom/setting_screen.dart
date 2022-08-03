import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/card_inkwl.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body: Center(
       child: Text('SettingScreen'),
        )
    );
  }
}

class Show extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BottomProvedr value=Provider.of<BottomProvedr>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_downward)),
          Row(
            children: [
              SizedBox(height: 15,),
              CardInkwel('ألأعدادات', Icons.settings,(){}),



              SizedBox(height: 15,),


              CardInkwel('مندوب المبيعات', Icons.support_agent,(){}),

              SizedBox(height: 25,),
              CardInkwel('دليل الوسيط', Icons.touch_app,(){}),



            ],
          ),
          Row(
            children: [
              SizedBox(height: 25,),
              CardInkwel('اتصال بنا', Icons.call,(){}),


              SizedBox(height: 25,),
              CardInkwel('مشاركة التطبيق', Icons.share,(){}),


              SizedBox(height: 25,),
              CardInkwel('قيمنا علي المتجر', Icons.star_half,(){}),



              SizedBox(height: 15,),

            ],
          ),
          InkWell(
            onTap: (){
              value.checkisdark();
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: value.isdark?ColorManager.white:ColorManager.app
              ),

              child: Row(
                children: [
                  FlutterSwitch(
                    width: 70.0,
                    height: 35.0,
                    valueFontSize: 12.0,
                    inactiveIcon: Icon(Icons.wb_sunny_sharp,color: Colors.amber,),
                    activeIcon: Icon(Icons.dark_mode,color: Colors.black,),
                    toggleSize: 25,
                    value: value.isdark,
                    borderRadius: 20.0,
                    inactiveColor: ColorManager.lightgray,
                    inactiveToggleColor: ColorManager.black,
                    activeColor: ColorManager.app,
                    padding: 6.0,
                    activeText: 'ليلي',
                    showOnOff: true,
                    inactiveText: 'نهاري',
                    onToggle: (valuee){
                      value.checkisdark();
                    },),

                  Icon(value.isdark?Icons.dark_mode:Icons.wb_incandescent_rounded,),
                  SizedBox(width: 15,),
                  Text('الوضع اليلي والنهاري',style: Theme.of(context).textTheme.bodyLarge,),


                ],

              ),
            ),
          ),

          Divider(color: Colors.grey,thickness: 2,),
          CardInkwel('تسجيل الخروج', Icons.exit_to_app,(){

          }),

          SizedBox(height: 11,),
        ],
      ),
    ),
    );
  }
}






