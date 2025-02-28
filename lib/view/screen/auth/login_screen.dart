import 'package:bunny_ngim_app/controller/sms_controller.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/custom_textfiled.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/code_picker_widget.dart';
import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:bunny_ngim_app/view/screen/auth/verify_otp_screen.dart';
import 'package:bunny_ngim_app/view/screen/auth/widget/social_login_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _countryDialCode = "+855";
  bool _isLoading = false;
  TextEditingController phoneNumberController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void _onPressed() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const ttmLogo(),
                Align(child: Image.asset(Images.logo, width: 150)),
                SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Text(
                  "sign_in".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeExtraLarge,
                  ),
                ),
                SizedBox(height: Dimensions.paddingSizeLarge),
                Text(
                  "phone_number".tr,
                  style: TextStyle(fontSize: Dimensions.fontSizeDefault),
                ),
                SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.paddingSizeSmall,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                            color: Theme.of(context).hintColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            Dimensions.radiusSizeSmall,
                          ),
                        ),
                        child: CodePickerWidget(
                          onChanged: (CountryCode countryCode) {
                            _countryDialCode = countryCode.dialCode!;
                          },
                          hideSearch: true,
                          initialSelection: _countryDialCode,
                          favorite: [_countryDialCode],
                          showDropDownButton: false,
                          showFlagMain: true,

                          textStyle: titilliumRegular.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Expanded(
                        child: SizedBox(
                          child: CustomTextField(
                            controller: phoneNumberController,
                            hinttext: "enter_phone_number".tr,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.paddingSizeExtraLarge),

                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                      onTap: () async {
                        String phone = phoneNumberController.text.trim();
                        String numberWithCountryCode = _countryDialCode + phone;
                        if (phoneNumberController.text.trim().startsWith('0')) {
                          numberWithCountryCode =
                              numberWithCountryCode.substring(
                                0,
                                _countryDialCode.length,
                              ) +
                              phoneNumberController.text.trim().substring(1);
                        }

                        if (phoneNumberController.text.isEmpty) {
                          showCustomSnackBar(
                            'please_enter_phone_number'.tr,
                            context,
                          );
                        } else {
                          _onPressed();
                          await Get.find<SMSController>().send(
                            numberWithCountryCode,
                          );
                        }
                      },
                      text: 'sign_in'.tr,
                    ),
                SizedBox(height: Dimensions.paddingSizeLarge),
                SocialLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
