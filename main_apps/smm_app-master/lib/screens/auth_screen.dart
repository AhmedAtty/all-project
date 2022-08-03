import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/auth_provider.dart';
import 'package:smm_app/providers/language_provider.dart';
import 'package:smm_app/screens/forgot_password_screen.dart';
import 'package:smm_app/screens/home_screen.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthProvider _authProvider;
  late LanguageProvider _languageProvider;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _authProvider = Provider.of<AuthProvider>(context);
    _languageProvider = Provider.of<LanguageProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          _languageProvider.changeLocale();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _languageProvider.locale.languageCode == 'ar'
                                  ? 'English'
                                  : 'العربية',
                              style: AppStyles.semiBold(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.language_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    S.of(context).login,
                    style: AppStyles.bold(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (!_authProvider.isLogin)
                    CustomTextField(
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
                        _authProvider.firstName = value!;
                      },
                    ),
                  if (!_authProvider.isLogin)
                    CustomTextField(
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
                        _authProvider.lastName = value!;
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
                      _authProvider.email = value!;
                    },
                  ),
                  if (!_authProvider.isLogin)
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
                        _authProvider.phone = value!;
                      },
                    ),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    hint: S.of(context).password,
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (!_authProvider.isLogin && value!.length < 8) {
                        return S.of(context).passwordMustBeALeast8Characters;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authProvider.password = value!;
                    },
                    onChanged: (value) {
                      _authProvider.password = value!;
                    },
                  ),
                  if (!_authProvider.isLogin)
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      hint: S.of(context).confirmPassword,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      validator: (value) {
                        if (value! != _authProvider.password) {
                          _authProvider.passwordsMatched = false;
                          return S.of(context).passwordsDidntMatch;
                        }
                        _authProvider.passwordsMatched = true;
                        return null;
                      },
                    ),
                  if (_authProvider.isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).forgotPassword,
                            style: AppStyles.medium(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(
                    height: 24,
                  ),
                  // const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        await _authProvider.authenticate(context, _formKey,
                            callback: (success, error) {
                          if (success) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
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
                            _authProvider.isLogin
                                ? S.of(context).signIn
                                : S.of(context).signUp,
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
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      _authProvider.toggleLogin();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            text:
                                '${_authProvider.isLogin ? S.of(context).dontHaveAnAccount : S.of(context).haveAnAccount} ',
                            style: AppStyles.medium(
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: _authProvider.isLogin
                                    ? S.of(context).signUp
                                    : S.of(context).signIn,
                                style: AppStyles.semiBold(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      S.of(context).bySigningInYouAgreeToTheUserAgreementAnd,
                      style: AppStyles.regular(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
