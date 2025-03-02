import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final Function()? onTap;
  const CustomBackButton({super.key, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        margin: const EdgeInsets.all(Dimensions.paddingSizeDefault - 3),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
          color: Theme.of(context).cardColor,
        ),
        child: Container(
          margin: EdgeInsets.only(left: GetPlatform.isIOS ? 5 : 5),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: Dimensions.iconSizeSmall,
          ),
        ),
      ),
    );
  }
}
