import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/support_provider.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/widgets/custom_text_field.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late SupportProvider _supportProvider;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _supportProvider = Provider.of<SupportProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).support),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 32,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  hint: S.of(context).name,
                  prefixIcon: Icons.person_outline_outlined,
                  validator: (value) {
                    if (value!.length < 3) {
                      return S.of(context).enterAValidName;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _supportProvider.name = value!;
                  },
                ),
                CustomTextField(
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
                    _supportProvider.phone = value!;
                  },
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hint: S.of(context).emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (!EmailValidator.validate(value!)) {
                      return S.of(context).enterAValidEmailAddress;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _supportProvider.email = value!;
                  },
                ),
                CustomTextField(
                  height: 200,
                  keyboardType: TextInputType.multiline,
                  hint: S.of(context).message,
                  prefixIcon: Icons.message_outlined,
                  maxLines: 6,
                  validator: (value) {
                    if (value!.length < 3) {
                      return S.of(context).pleaseEnterYourMessage;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _supportProvider.message = value!;
                  },
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      await _supportProvider.sendMessage(context,
                          formKey: _formKey, callback: (success, error) {
                        if (success) {
                          Navigator.pop(context);
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
                                  S.of(context).messageSentSuccessfully,
                                ),
                              ),
                            ),
                          );
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
                          S.of(context).send,
                          style: AppStyles.semiBold(
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
