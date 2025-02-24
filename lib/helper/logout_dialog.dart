import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusSizeLarge),
      ),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(.2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Images.Logout,
                  color: Theme.of(context).colorScheme.error,
                  width: Dimensions.iconSizeDefault,
                  height: Dimensions.iconSizeDefault,
                ),
              ),
              SizedBox(height: Dimensions.paddingSizeExtraLarge),
              Text(
                'are_you_sure_to_logout'.tr,
                textAlign: TextAlign.center,
                style: titilliumBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),
              SizedBox(height: Dimensions.paddingSizeExtraLarge),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      text: 'cancel'.tr,
                      onTap: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: Dimensions.paddingSizeExtraLarge),
                  Expanded(
                    child: CustomButton(text: 'logout'.tr, onTap: () async {}),
                  ),
                ],
              ),
              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

              // SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            ],
          ),
        ),
      ),
    );
  }
}
