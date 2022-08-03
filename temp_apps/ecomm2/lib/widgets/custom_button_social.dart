import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustumButtonSocial extends StatelessWidget {
  const CustumButtonSocial(
      {Key? key, required this.text, required this.imageUrl, this.onPressed})
      : super(key: key);
  final String text;
  final String imageUrl;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: onPressed!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imageUrl),
            const SizedBox(width: 80),
            //Image.asset('assets/images/Google.png'),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
