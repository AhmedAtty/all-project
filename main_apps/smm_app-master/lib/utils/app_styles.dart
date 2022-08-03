import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle _baseStyle = GoogleFonts.cairo();

  static TextStyle semiBold(
          {double? fontSize,
          Color? color,
          TextDecoration? decoration,
          double? height}) =>
      _baseStyle.copyWith(
          fontSize: fontSize,
          height: height,
          color: color ?? Colors.black,
          fontWeight: FontWeight.w600,
          decoration: decoration);

  static TextStyle bold(
          {double? fontSize,
          Color? color,
          TextDecoration? decoration,
          double? height}) =>
      _baseStyle.copyWith(
          fontSize: fontSize,
          height: height,
          color: color ?? Colors.black,
          fontWeight: FontWeight.w700,
          decoration: decoration);

  static TextStyle regular(
          {double? fontSize,
          Color? color,
          TextDecoration? decoration,
          double? height}) =>
      _baseStyle.copyWith(
          fontSize: fontSize,
          height: height,
          color: color ?? Colors.black,
          fontWeight: FontWeight.w400,
          decoration: decoration);

  static TextStyle medium(
          {double? fontSize,
          Color? color,
          TextDecoration? decoration,
          double? height}) =>
      _baseStyle.copyWith(
          fontSize: fontSize,
          height: height,
          color: color ?? Colors.black,
          fontWeight: FontWeight.w500,
          decoration: decoration);
}
