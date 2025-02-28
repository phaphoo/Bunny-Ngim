import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SearchHomePageWidget extends StatelessWidget {
  const SearchHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeExtraExtraSmall,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeSmall,
        ),

        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSizeLarge,
            right: Dimensions.paddingSizeExtraSmall - 1,
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).hintColor.withValues(alpha: .1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(
              Dimensions.paddingSizeExtraSmall,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'search_item'.tr,
                style: titilliumRegular.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                child: Image.asset(
                  Images.search,
                  color: Theme.of(context).hintColor,
                  width: Dimensions.iconSizeLarge,
                  height: Dimensions.iconSizeLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
