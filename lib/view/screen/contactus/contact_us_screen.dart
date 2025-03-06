import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/custom_textfiled.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsScreen extends StatefulWidget {
  final bool isBackToExit;
  const ContactUsScreen({super.key, this.isBackToExit = false});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'contact_us'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: GetBuilder<ConfigController>(
        builder: (config) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: CustomImage(
                        image: config.companyProfile!.logo ?? '',
                        height: Get.width / 2.5,
                        width: Get.width / 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  Center(
                    child: Text(
                      'contact_to_pfk_support'.tr,
                      style: titilliumBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radiusSizeExtraSmall,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(.125),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.paddingSizeSmall,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CustomImage(
                                image: Images.addressMap,
                                height: Get.width / 9,
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeDefault,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'address'.tr,
                                    style: titilliumBold.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  SizedBox(
                                    width: Get.width / 1.5,
                                    child: Text(
                                      config.companyProfile!.address ?? '',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.radiusSizeExtraSmall,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(.125),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.paddingSizeSmall,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              CustomImage(
                                image: Images.smartphone,
                                height: Get.width / 9,
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeDefault,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'phone_number'.tr,
                                    style: titilliumBold.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  SizedBox(
                                    width: Get.width / 1.5,
                                    child: Text(
                                      config.companyProfile!.phone ?? '',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  Center(
                    child: Text(
                      'contact_form'.tr,
                      style: titilliumBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('name'.tr),
                            const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                            CustomTextField(hinttext: 'enter_your_name'.tr),
                          ],
                        ),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeDefault),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('email'.tr),
                            const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                            CustomTextField(hinttext: 'enter_your_email'.tr),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text('message'.tr),
                  const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                  CustomTextField(hinttext: 'message'.tr, isEnter: true),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  CustomButton(text: 'submit'.tr),
                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  Center(
                    child: Text(
                      'social_media'.tr,
                      style: titilliumBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Center(
                    child: SizedBox(
                      height: Get.width / 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: config.configModel!.contactus.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(
                              Dimensions.paddingSizeSmall,
                            ),
                            child: InkWell(
                              onTap: () {
                                openLink(
                                  config.configModel!.contactus[index].info ??
                                      '',
                                );
                              },
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: CustomImage(
                                      image: Images.instagram,
                                      height: Get.width / 7,
                                      width: Get.width / 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

openLink(String url) async {
  if (url.isNotEmpty) {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      showCustomSnackBar('${'could_not_lunch'}  $url', Get.context!);
    }
  }
}
