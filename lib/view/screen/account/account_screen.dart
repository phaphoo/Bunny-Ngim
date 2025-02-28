import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/screen/auth/login_screen.dart';
import 'package:bunny_ngim_app/view/screen/language/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class AccountScreen extends StatefulWidget {
  final bool isBackToExit;
  const AccountScreen({super.key, this.isBackToExit = false});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'account'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: Column(
        children: [
          CustomButton(
            text: 'login'.tr,
            onTap: () => Get.to(() => LoginScreen()),
          ),
        ],
      ),
    );
  }
}
