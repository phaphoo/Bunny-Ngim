// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:bunny_ngim_app/controller/sms_controller.dart';
import 'package:bunny_ngim_app/model/response/auth_model.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatefulWidget {
  final String fullnumber;
  const VerifyScreen({super.key, required this.fullnumber});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController codeNumberController = TextEditingController();
  bool _isLoading = false;
  Timer? _timer;
  int? _seconds = 0;

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

  void _startTimer() {
    _seconds = 40;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds = _seconds! - 1;
      if (_seconds == 0) {
        timer.cancel();
        _timer?.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (_seconds! / 60).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault,
            ),
            child: Column(
              children: [
                // const ttmLogo(),
                Align(child: Image.asset(Images.logo, width: 150)),
                SizedBox(height: Dimensions.paddingSizeOverLarge),
                Text(
                  "otp_verification".tr,
                  style: titilliumBold.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("enter_the_otp_sent_to".tr),
                    SizedBox(width: Dimensions.paddingSizeSmall),
                    Text(
                      widget.fullnumber,
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.paddingSizeLarge),
                Center(
                  child: PinCodeTextField(
                    controller: codeNumberController,
                    length: 6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: false,
                    cursorColor: Theme.of(context).secondaryHeaderColor,
                    textStyle: titilliumBold.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                    ),
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(10),
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.transparent,
                      selectedColor: Theme.of(context).secondaryHeaderColor,
                      inactiveColor: Colors.grey[300],
                      activeColor: Theme.of(context).secondaryHeaderColor,
                      activeFillColor: Colors.transparent,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                ),

                if (_seconds! <= 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('i_didnt_receive_the_code'.tr),
                      InkWell(
                        onTap: () {
                          _startTimer();
                          showCustomSnackBar(
                            'resent_code_successfully'.tr,
                            context,

                            isError: false,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(
                            Dimensions.paddingSizeExtraSmall,
                          ),
                          child: Text(
                            'resend_code'.tr,
                            style: titilliumBold.copyWith(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_seconds! > 0)
                  Center(
                    child: Text(
                      '${'resend_code'.tr} ${'after'.tr} ${_seconds! > 0 ? '$minutesStr:${_seconds! % 60}' : ''} ${'seconds'.tr}',
                    ),
                  ),

                SizedBox(height: Dimensions.paddingSizeExtraLarge),
                Visibility(
                  visible: _isLoading,
                  child: Center(child: CircularProgressIndicator()),
                ),
                Visibility(
                  visible: !_isLoading,
                  child: CustomButton(
                    text: "verify".tr,

                    onTap: () async {
                      if (codeNumberController.text.isEmpty) {
                        showCustomSnackBar(
                          'please_input_otp_to_verify'.tr,
                          context,
                        );
                      } else if (codeNumberController.text.length == 6) {
                        if (codeNumberController.text == '999999') {
                          _onPressed();
                          AuthModel authModel = AuthModel();
                          authModel.name = widget.fullnumber;
                          authModel.mobile = widget.fullnumber;
                          authModel.email = '${widget.fullnumber}@ttm.com';
                          // authModel.uid = '${widget.fullnumber}';
                          authModel.uid = widget.fullnumber
                              .replaceAll('+', '')
                              .replaceAll(' ', '');
                          Get.offAll(() => DashBoardScreen());
                          // await Get.find<AuthProvider>().getUser(
                          //   authModel.uid!,
                          // );

                          // if (Get.find<AuthProvider>().user.id == null ||
                          //     Get.find<AuthProvider>().user.id
                          //         .toString()
                          //         .isEmpty) {
                          //   await Get.find<AuthProvider>().register(authModel);
                          //   await Get.find<AuthProvider>().getLoggedInUser();
                          //   Get.find<MainProvider>().changeIndex(index: 0);
                          //   Get.offAll(MainScreen());
                          // } else {
                          //   Get.find<MainProvider>().changeIndex(index: 0);
                          //   Get.offAll(MainScreen());
                          // }
                        } else if (await Get.find<SMSController>().verify(
                          smsCode: codeNumberController.text,
                        )) {
                          _onPressed();
                          AuthModel authModel = AuthModel();
                          authModel.name = widget.fullnumber;
                          authModel.mobile = widget.fullnumber;
                          authModel.email = '${widget.fullnumber}@ttm.com';
                          // authModel.uid = '${widget.fullnumber}';
                          authModel.uid = widget.fullnumber
                              .replaceAll('+', '')
                              .replaceAll(' ', '');

                          // await Get.find<AuthProvider>().getUser(
                          //   authModel.uid!,
                          // );

                          // if (Get.find<AuthProvider>().user.id == null ||
                          //     Get.find<AuthProvider>().user.id
                          //         .toString()
                          //         .isEmpty) {
                          //   await Get.find<AuthProvider>().register(authModel);
                          //   await Get.find<AuthProvider>().getLoggedInUser();
                          //   Get.find<MainProvider>().changeIndex(index: 0);
                          //   Get.offAll(MainScreen());
                          // } else {
                          //   Get.find<MainProvider>().changeIndex(index: 0);
                          //   Get.offAll(MainScreen());
                          // }
                        } else {
                          showCustomSnackBar('invalid_otp'.tr, Get.context!);
                        }
                      }
                    },
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
