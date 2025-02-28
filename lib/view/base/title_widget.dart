import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;
  const TitleWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: titilliumBold.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: Colors.black,
            ),
          ),
          (onTap != null && !ResponsiveHelper.isDesktop())
              ? InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Text(
                    'see_more'.tr,
                    style: titilliumRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
