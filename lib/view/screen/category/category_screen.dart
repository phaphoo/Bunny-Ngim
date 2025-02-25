import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CategoryScreen extends StatefulWidget {
  final bool isBackToExit;
  const CategoryScreen({super.key, this.isBackToExit = false});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'category'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
    );
  }
}
