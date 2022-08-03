import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/my_account_provider.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/widgets/custom_text_field.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  late MyAccountProvider _accountProvider;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _accountProvider = Provider.of<MyAccountProvider>(context);
    _accountProvider.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myAccount),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              _accountProvider.toggleEdit();
            },
            child: Text(
              !_accountProvider.isEdit
                  ? S.of(context).edit
                  : S.of(context).cancel,
              style: AppStyles.medium(fontSize: 18, color: AppColors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 16,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.network(
                      _accountProvider.user.image!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  initialValue: _accountProvider.user.firstName,
                  enabled: _accountProvider.isEdit,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  hint: S.of(context).firstName,
                  prefixIcon: Icons.person_outline_outlined,
                  validator: (value) {
                    if (value!.length < 3) {
                      return S.of(context).enterAValidName;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _accountProvider.user.firstName = value!;
                  },
                ),
                CustomTextField(
                  initialValue: _accountProvider.user.lastName!,
                  enabled: _accountProvider.isEdit,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  hint: S.of(context).lastName,
                  prefixIcon: Icons.person_outline_outlined,
                  validator: (value) {
                    if (value!.length < 3) {
                      return S.of(context).enterAValidName;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _accountProvider.user.lastName = value!;
                  },
                ),
                CustomTextField(
                  initialValue: _accountProvider.user.email!,
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  hint: S.of(context).emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),
                CustomTextField(
                  initialValue: _accountProvider.user.phone!,
                  enabled: _accountProvider.isEdit,
                  keyboardType: TextInputType.phone,
                  hint: S.of(context).mobileNumber,
                  prefixIcon: Icons.phone_android_outlined,
                  validator: (value) {
                    if (value!.length < 11 || value.length > 12) {
                      return S.of(context).pleaseEnterAValidPhoneNumber;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _accountProvider.user.phone = value!;
                  },
                ),
                const SizedBox(
                  height: 36,
                ),
                const Spacer(),
                if (_accountProvider.isEdit)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        await _accountProvider.update(context,
                            callback: (success, error) {
                          if (success) {
                            _accountProvider.isEdit = false;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                elevation: 10,
                                duration: const Duration(seconds: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    error,
                                  ),
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            S.of(context).save,
                            style: AppStyles.semiBold(
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
