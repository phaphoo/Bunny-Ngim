import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class FavoriteScreen extends StatefulWidget {
  final bool isBackToExit;
  const FavoriteScreen({super.key, this.isBackToExit = false});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'favorite'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
    );
  }
}
