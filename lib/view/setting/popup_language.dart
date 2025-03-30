import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupLanguage extends StatefulWidget {
  const PopupLanguage({super.key});

  @override
  State<PopupLanguage> createState() => _PopupLanguageState();
}

class _PopupLanguageState extends State<PopupLanguage> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = Get.find<LocalizationController>().selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationProvider) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeLarge),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault,
              horizontal: Dimensions.paddingSizeDefault,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault,
              horizontal: Dimensions.paddingSizeDefault,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'select_language'.tr,
                  style: titilliumBold.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimensions.paddingSizeSmall,
                    bottom: Dimensions.paddingSizeLarge,
                  ),
                  child: Text('choose_your_language_to_proceed'.tr),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstants.languages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          localizationProvider.setSelectIndex(index);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Dimensions.paddingSizeDefault,
                          0,
                          Dimensions.paddingSizeDefault,
                          Dimensions.paddingSizeSmall,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.paddingSizeExtraSmall,
                            ),
                            color:
                                selectedIndex == index
                                    ? Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(.1)
                                    : Theme.of(context).cardColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeDefault,
                              vertical: Dimensions.paddingSizeSmall,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Image.asset(
                                    AppConstants.languages[index].imageUrl!,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSizeSmall,
                                  ),
                                  child: Text(
                                    AppConstants.languages[index].languageName!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Dimensions.paddingSizeSmall,
                    Dimensions.paddingSizeSmall,
                    Dimensions.paddingSizeSmall,
                    0,
                  ),
                  child: CustomButton(
                    text: 'save'.tr,
                    onTap: () {
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
                      Get.find<ConfigController>().getHomePageData();
                      Get.find<CategoryController>().getCategoryList();
                      Get.find<ProductController>().getAllProductList();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],

              // child: Center(

              //   child: Column(mainAxisSize: MainAxisSize.min, children: [

              //     Text(getTranslated('select_language', context)!, style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),

              //     Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeLarge),
              //       child: Text('${getTranslated('choose_your_language_to_proceed', context)}'),),

              //     ListView.builder(
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemCount: AppConstants.languages.length,
              //         shrinkWrap: true,
              //         itemBuilder: (context, index){
              //         return InkWell(
              //           onTap: (){
              //             setState(() {
              //               selectedIndex = index;
              //             });
              //           },
              //           child: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall),
              //             child: Container(decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
              //               color: selectedIndex == index? Theme.of(context).primaryColor.withOpacity(.1): Theme.of(context).cardColor),
              //               child: Padding(
              //                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),
              //                 child: Row(children: [
              //                 SizedBox(width: 25, child: Image.asset(AppConstants.languages[index].imageUrl!)),

              //                   Padding(
              //                     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              //                     child: Text(AppConstants.languages[index].languageName!),
              //                   )

              //             ],),
              //               ),),
              //           ),
              //         );

              //     }),

              //     Padding(
              //       padding: const EdgeInsets.fromLTRB( Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,0),
              //       child: CustomButton(buttonText: '${getTranslated('select', context)}', onTap: (){
              //         Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
              //           AppConstants.languages[selectedIndex].languageCode!,
              //           AppConstants.languages[selectedIndex].countryCode,
              //         ));
              //         Provider.of<CategoryProvider>(context, listen: false).getCategoryList(true);
              //         Provider.of<HomeCategoryProductProvider>(context, listen: false).getHomeCategoryProductList(true);
              //         Provider.of<TopSellerProvider>(context, listen: false).getTopSellerList(true);
              //         Provider.of<BrandProvider>(context, listen: false).getBrandList(true);
              //         Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, reload: true);
              //         Provider.of<ProductProvider>(context, listen: false).getFeaturedProductList('1', reload: true);
              //         Provider.of<FeaturedDealProvider>(context, listen: false).getFeaturedDealList(true);
              //         Provider.of<ProductProvider>(context, listen: false).getLProductList('1', reload: true);
              //         Navigator.pop(context);
              //       },),
              //     )

              //   ],

              // ),
              //child: Container(padding: const EdgeInsets.only(bottom: 30, top: 30),
              //margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              //decoration: BoxDecoration(
              //color: Theme.of(context).cardColor,

              //borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.paddingSizeDefault))
              //),
            ),
          ),
        );
        //)
      },
    );
  }
}
