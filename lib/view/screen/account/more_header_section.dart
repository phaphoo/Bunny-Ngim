import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/not_logged_in_bottom_sheet.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreHeaderSection extends StatelessWidget {
  const MoreHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isGuestMode = true;
    return GetBuilder<ConfigController>(
      builder: (profile) {
        return
        // profile.companyProfile != null
        //     ?
        Stack(
          children: [
            Positioned(
              right: -110,
              bottom: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Theme.of(context).cardColor.withOpacity(.05),
                    width: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimensions.paddingSizeDefault,
                70.0,
                Dimensions.paddingSizeDefault,
                0,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (isGuestMode) {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => const NotLoggedInBottomSheet(),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        Images.guestProfile,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeDefault),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //     !isGuestMode
                        //         ? '${profile.userInfoModel?.fName ?? ''} ${profile.userInfoModel?.lName ?? ''}'
                        //         : 'Guest',
                        //     style: textBold.copyWith(
                        //         color: Colors.black,
                        //         fontSize: Dimensions.fontSizeLarge)),
                        Text(
                          'Hi, ${'Guest'}!',
                          style: titilliumBold.copyWith(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (isGuestMode) {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => const NotLoggedInBottomSheet(),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 25,
                        child: Image.asset(
                          Images.edit,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        // : const SizedBox();
      },
    );
  }
}
