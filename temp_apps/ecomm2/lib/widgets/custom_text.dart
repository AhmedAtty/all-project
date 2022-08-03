import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize=16 ,
    this.color = Colors.black,
    this.alignment=Alignment.topLeft,
  }) : super(key: key);

  final String text;
  final int fontSize;
  final Color color;
 final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize.toDouble(),
        ),
      ),
    );
  }
}
