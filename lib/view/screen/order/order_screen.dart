import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class OrderScreen extends StatefulWidget {
  final bool isBackToExit;
  const OrderScreen({super.key, this.isBackToExit = false});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'history'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: Center(child: NoInternetOrDataScreenWidget(isNoInternet: false)),
    );
  }
}
