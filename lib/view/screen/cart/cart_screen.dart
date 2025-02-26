import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CartScreen extends StatefulWidget {
  final bool isBackToExit;
  const CartScreen({super.key, this.isBackToExit = false});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_cart'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
    );
  }
}
