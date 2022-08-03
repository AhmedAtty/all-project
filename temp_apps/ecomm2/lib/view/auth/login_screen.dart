import 'package:ecomm2/constance.dart';
import 'package:ecomm2/view_model/auth_view_model.dart';
import 'package:ecomm2/widgets/custom_button.dart';
import 'package:ecomm2/widgets/custom_button_social.dart';
import 'package:ecomm2/widgets/custom_text.dart';
import 'package:ecomm2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class loginScreen extends GetWidget<AuthViewModel> {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Welcome,',
                  fontSize: 30,
                ),
                CustomText(
                  text: 'Sign Up',
                  color: primaryColor,
                  fontSize: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Sign in to Continue',
              color: Colors.grey,
              fontSize: 14,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              validator: (value) {
                return 'aac';
              },
              onSave: (value) {},
              text: 'Email',
              hint: 'ahmedaty@windowslive.com',
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              text: 'Password',
              hint: '*****************',
              validator: (value) {
                return "null";
              },
              onSave: (value) {},
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: 'Forgot Password',
              //color: Colors.grey,
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            const SizedBox(height: 20),
            // ignore: deprecated_member_use
            CustomButton(
              onPressed: () {},
              text: 'SIGN IN',
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: '-OR-',
              // color: Colors.white,
              fontSize: 20,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 20),
             CustumButtonSocial(
              onPressed: (){
               // controller.facebookSignInMethod();
              },
              text: 'Sign In with Facebook',
              imageUrl: 'assets/images/Facebook.png',
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300, thickness: .2),
            const SizedBox(height: 10),
             CustumButtonSocial(
               onPressed: (){
                 controller.googleSignInMethod();
               },
              text: 'Sign In with Google',
              imageUrl: 'assets/images/Google.png',
            ),
          ],
        ),
      ),
    );
  }
}
