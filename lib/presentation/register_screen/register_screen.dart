import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_advisory_app/core/utils/app_texts.dart';
import 'package:tax_advisory_app/presentation/register_success_screen/register_success_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../otp/otp_screen.dart';
import '../personal_info_screen/personal_info_screen.dart'; // ignore_for_file: must_be_immutable

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newText = newValue.text;
    if (newText.length > 12) {
      return oldValue;
    }
    if (newText.startsWith('255')) {
      return newValue;
    }
    return TextEditingValue(
      text: '255${newText}',
      selection: TextSelection.collapsed(offset: newText.length + 3),
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreed = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [theme.colorScheme.primaryContainer, appTheme.gray100],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: SizeUtils.height,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildTaxAdvisorySystemStack(context),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 66.v,
                          ),
                          decoration: AppDecoration.fillBluegray5001.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL38,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    UsedWords.titleRegister,
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer,
                                  ),
                                ),
                              ),
                              SizedBox(height: 64.v),
                              CustomTextFormField(
                                controller: emailController,
                                hintText: "255xxxxxxxx",
                                textInputType: TextInputType.phone,
                                inputFormatters: [PhoneInputFormatter()],
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(19.h, 22.v, 30.h, 22.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLock,
                                    height: 11.v,
                                    width: 14.h,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(maxHeight: 56.v),
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length < 12) {
                                    return 'Please enter your phone number';
                                  }
                                  // You can add additional phone number validation here if needed
                                  return null;
                                },
                              ),
                              SizedBox(height: 36.v),
                              CustomTextFormField(
                                controller: passwordController,
                                hintText: UsedWords.password,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(16.h, 18.v, 30.h, 18.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLockPrimary,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(maxHeight: 56.v),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 36.v),
                              CustomTextFormField(
                                controller: password2Controller,
                                hintText: UsedWords.password2,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(16.h, 18.v, 30.h, 18.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLockPrimary,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(maxHeight: 56.v),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 43.v),
                              CheckboxListTile(
                                value: _agreed,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _agreed = value ?? false;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "By continuing I agree with the ",
                                        style: CustomTextStyles.interOnPrimary.copyWith(
                                          fontSize: 12.0, // Set the fontsize to 12.0
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: CustomTextStyles.interBlueA400.copyWith(
                                          fontSize: 12.0, // Set the fontsize to 12.0
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ", ",
                                        style: CustomTextStyles.interOnPrimary.copyWith(
                                          fontSize: 12.0, // Set the fontsize to 12.0
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: CustomTextStyles.interBlueA400.copyWith(
                                          fontSize: 12.0, // Set the fontsize to 12.0
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                activeColor: Colors.blue, // Set the checkbox tick color to blue
                              ),
                              SizedBox(height: 20.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PersonalInfoScreen(phoneNumber: emailController, password: passwordController,), // Replace YourNextScreen with the actual screen you want to navigate to
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please fill all fields"),
                                      ),
                                    );
                                  }
                                },
                                text: "Next",
                              ),
                              SizedBox(height: 37.v),
                              SizedBox(height: 3.v)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 337.v,
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage296x371,
              height: 296.v,
              width: 371.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  bottom: 38.v,
                ),
                child: Text(
                  " Tax Advisory system",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
