import 'dart:async';
import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Get.context!,
        MaterialPageRoute(builder: (context) => const DashBoardScreen()),
      );
    });
  }

  Future loaddata() async {
    // await Get.find<ConfigController>().getConfigData();
    await Get.find<CategoryController>().getCategoryList();
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
      body:
          Get.find<ConfigController>().hasConnection
              ? Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Image.asset(
                      Images.logo,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 6,
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
              )
              : NoInternetOrDataScreenWidget(
                isNoInternet: true,
                child: SplashScreen(),
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
