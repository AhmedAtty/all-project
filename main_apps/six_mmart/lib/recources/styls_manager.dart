

import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontsize,FontWeight fontWeight,Color color){
  return TextStyle(fontSize: fontsize,
  fontFamily: FontConstants.FontFamily,color: color,
  fontWeight: fontWeight);
}
//regular style
TextStyle getRegularStyle({
  double fontsize=FontSize.s12,
  required Color color
}){
  return _getTextStyle(fontsize, FontWeightManager.regular,color);
}

//medium style
TextStyle getMediumStyle({
  double fontsize=FontSize.s14,
  required Color color
}){
  return _getTextStyle(fontsize, FontWeightManager.medium,color);
}

      //light style
      TextStyle getLightStyle({
        double fontsize=FontSize.s14,
        required Color color
      }){
        return _getTextStyle(fontsize, FontWeightManager.light,color);
      }

//bold style
TextStyle getBoldStyle({
  double fontsize=FontSize.s14,
  required Color color
}){
  return _getTextStyle(fontsize, FontWeightManager.bold,color);
}
    //semibold style
    TextStyle getSemiBoldStyle({
      double fontsize=FontSize.s14,
      required Color color
    }){
      return _getTextStyle(fontsize, FontWeightManager.semibold,color);
    }

