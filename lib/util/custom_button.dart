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

  CustomButton({
    Key? key,
    required this.text,
    this.onTap,
    this.color,
    this.borderColor, // Border color is optional
    this.borderWidth, // Border width is optional
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
          color: color ?? Theme.of(context).secondaryHeaderColor,
          // Apply the border only if borderColor or borderWidth is provided
          border:
              (borderColor != null || borderWidth != null)
                  ? Border.all(
                    color: borderColor ?? Theme.of(context).hintColor,
                    width: borderWidth ?? 1.0, // Use default width if null
                  )
                  : null, // No border if neither property is provided
        ),
        child: Text(
          text,
          style: titilliumRegular.copyWith(
            color: color != null ? Theme.of(context).hintColor : Colors.white,
          ),
          // style: titilliumRegular.copyWith(
          //   color: Theme.of(context).hintColor,
          // ),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
