import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomExitCard extends StatelessWidget {
  const CustomExitCard({super.key});

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
            'close_the_app',
            style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeSmall,
              bottom: Dimensions.paddingSizeLarge,
            ),
            child: Text('do_you_want_to_close_and_exit_app'.tr),
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
                    text: 'exit'.tr,
                    onTap: () => SystemNavigator.pop(),
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
