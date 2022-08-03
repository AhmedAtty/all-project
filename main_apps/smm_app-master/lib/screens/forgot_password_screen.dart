import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/forgot_password_provider.dart';
import 'package:smm_app/widgets/custom_elevated_button.dart';
import 'package:smm_app/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ForgotPasswordProvider _forgotPasswordProvider;

  @override
  void didChangeDependencies() {
    _forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).resetPassword),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: CustomTextField(
                hint: S.of(context).emailAddress,
                prefixIcon: Icons.email_outlined,
                onSaved: (value) {
                  _forgotPasswordProvider.email = value!;
                },
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return S.of(context).enterAValidEmailAddress;
                  }
                  return null;
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.all(16),
                child: CustomElevatedButton(
                    onPressed: () {
                      _forgotPasswordProvider.resetPassword(context,
                          callback: (success, error) {
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
                                  error,
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
                      }, formKey: _formKey);
                    },
                    text: S.of(context).confirm))
          ],
        ),
      ),
    );
  }
}
