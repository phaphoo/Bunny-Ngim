import 'dart:async';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  final int? index;
  const SplashScreen({super.key, this.index});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _nav() async {
    // bool isLoggedIn = Get.find<AuthController>().isLoggedIn();

    // if (isLoggedIn) {

    //   authController.getUserInfo(id: int.parse(authController.getUserID()!));
    //   authController.updateToken(int.parse(authController.getUserID()!));
    // }

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  Future loaddata() async {
    // await Get.find<TemplateController>().getTemplate();
    // Get.find<AccountController>().getAccount();
  }

  @override
  void initState() {
    _requestNotificationPermission();
    _nav();
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Image.asset(
              Images.slash,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
            ),
          ),

          // const Spacer(),
          Positioned(
            right: 0,
            left: 0,
            bottom: Dimensions.paddingSizeExtraLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Phsar Farm Khmer - copy right.",
                  style: titleRegular.copyWith(
                    color: Theme.of(context).hintColor,
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
                Text(
                  "Version 1.0",
                  style: titleRegular.copyWith(
                    color: Theme.of(context).hintColor,
                    fontSize: Dimensions.fontSizeDefault,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Future<void> _requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
