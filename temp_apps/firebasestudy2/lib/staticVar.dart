import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sController extends GetxController {
  final double TSize = 16;
  double TSize1 = 14;
  Color primColor = Color.fromRGBO(0, 197, 105, 1);



//const Color primColor =Colors.pink;
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null ||
        value.isEmpty ||
        !regex.hasMatch(value) ||
        value.contains(".com") != true) {
      update();
      return 'Enter a valid email address';
    } else {
      return null;
    }

  }

  Padding buildPadding({
    required String? text,
    required String? hText,
    required String? Function(String?)? vald,
    required TextEditingController? con1,
    required TextInputType? type,
    required IconData? icon,
  }) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (val) {
          con1!.text = val;
          update();
        },
        onSaved: (val) async {
          con1!.text = val!;
          update();
        },
        validator: vald,
        keyboardType: type,
        cursorColor: primColor,
        decoration: InputDecoration(
          prefixIcon:  Icon(
            icon,
            color: Colors.grey,
          ),
          labelText: text!,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, color: primColor),
          hintText: hText!,
          helperStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: primColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: primColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: primColor, width: 2),
          ),
        ),
      ),
    );
  }
}
