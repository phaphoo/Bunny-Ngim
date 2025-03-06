import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutCustomBottomSheet extends StatelessWidget {
  const LogoutCustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40, top: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(Dimensions.paddingSizeDefault),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault,
            ),
            child: SizedBox(width: 60, child: Image.asset(Images.exitIcon)),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(
            'sign_out'.tr,
            style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeSmall,
              bottom: Dimensions.paddingSizeLarge,
            ),
            child: Text('want_to_sign_out'.tr),
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeOverLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: CustomButton(
                    text: 'cancel'.tr,
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer.withOpacity(.5),

                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeDefault),
                SizedBox(
                  width: 120,
                  child: CustomButton(
                    text: 'sign_out'.tr,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
