
import 'package:flutter/material.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/recources/font_manager.dart';
import 'package:sex_smart/recources/styls_manager.dart';
import 'package:sex_smart/recources/valeus_manager.dart';


ThemeData getApplictionThime(){
  return ThemeData(
    //main color
primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightprimary,
    primaryColorDark: ColorManager.darkprimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager.lightprimary,







    //cardiew thime

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4
    ),











    //app bar thime
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightprimary,
      titleTextStyle: getRegularStyle(
          fontsize: FontSize.s16,color: ColorManager.white
      )

    ),












    //boutton thime
  buttonTheme: ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: ColorManager.gray1,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.lightprimary
  ),









      //elvited button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white,fontsize: FontSize.s18),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)))),













     //text thime


          textTheme: TextTheme(
            displayLarge: getSemiBoldStyle(color: ColorManager.darkgry,fontsize: FontSize.s16),
            headlineLarge: getSemiBoldStyle(color: ColorManager.darkprimary,fontsize: FontSize.s16),
            titleMedium: getMediumStyle(color: ColorManager.primary,fontsize: FontSize.s14),
            bodyLarge: getRegularStyle(color: ColorManager.gray1),
            headlineMedium: getRegularStyle(color: ColorManager.darkgry,fontsize: FontSize.s14),
            bodySmall: getRegularStyle(color: ColorManager.gray),
          ),














    // inpout dacrtion theme (text form flield)
       inputDecorationTheme: InputDecorationTheme(
      //conten pinding
         contentPadding: EdgeInsets.all(AppPadding.p8),
         //hint style
         hintStyle: getRegularStyle(color: ColorManager.gray,fontsize: FontSize.s14),
         labelStyle: getMediumStyle(color: ColorManager.gray,fontsize: FontSize.s14),
         errorStyle: getRegularStyle(color: ColorManager.erorr),






         //enabled boredr style
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s2),
           borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8),)
         ),




         //foucs porder style
         focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: ColorManager.gray,width: AppSize.s2),
             borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8),)
         ),






         //error border style
         errorBorder: OutlineInputBorder(
             borderSide: BorderSide(color: ColorManager.erorr,width: AppSize.s2),
             borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8),)
         ),




         //foucsd border style
         focusedErrorBorder: OutlineInputBorder(
             borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s2),
             borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8),)
         ),
  )

  );
}