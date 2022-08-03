import 'package:flutter/material.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomElevatedButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: AppStyles.semiBold(
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
