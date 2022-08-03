import 'package:flutter/material.dart';

Color primColor = Colors.cyan;

Padding buildTextF({
  required String? text,
  required String? hText,
  required String? Function(String?)? vald,
  required TextEditingController? con1,
  required TextInputType? type,
  required IconData? icon,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      onChanged: (val) {
        con1!.text = val;
      },
      onSaved: (val) async {
        con1!.text = val!;
      },
      validator: vald,
      keyboardType: type,
      cursorColor: color,
      decoration: InputDecoration(
        prefixIcon: Icon(
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
            color: color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
    ),
  );
}
