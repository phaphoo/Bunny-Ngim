import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'language'.tr),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault,
        ),
        child: GetBuilder<LocalizationController>(
          builder: (localizationProvider) {
            return Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeLarge),
                ...localizationProvider.languages.map((language) {
                  bool isSelected =
                      localizationProvider.languages.indexOf(language) ==
                      localizationProvider.selectedIndex;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  isSelected
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).hintColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            localizationProvider.setSelectIndex(
                              localizationProvider.languages.indexOf(language),
                            );
                          },
                          title: Text(
                            language.languageName.toString(),
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                const Spacer(),
                CustomButton(
                  text: 'submit'.tr,
                  onTap: () async {
                    localizationProvider.setLanguage(
                      Locale(
                        localizationProvider
                            .languages[localizationProvider.selectedIndex]
                            .languageCode!,
                        localizationProvider
                            .languages[localizationProvider.selectedIndex]
                            .countryCode!,
                      ),
                    );
                    Get.back();
                  },
                ),
                SizedBox(height: Dimensions.paddingSizeDefault),
              ],
            );
          },
        ),
      ),
    );
  }
}
