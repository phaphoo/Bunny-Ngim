import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  final Color? borderColor; // Optional: Border color
  final double? borderWidth; // Optional: Border width

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: ResponsiveHelper.isTab() ? 60 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: color ?? Theme.of(context).primaryColor,
          border:
              (borderColor != null || borderWidth != null)
                  ? Border.all(
                    color: borderColor ?? Theme.of(context).hintColor,
                    width: borderWidth ?? 1.0,
                  )
                  : null,
        ),
        child: Text(
          text,
          style: titilliumBold.copyWith(
            color: color != null ? Theme.of(context).hintColor : Colors.white,
          ),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
