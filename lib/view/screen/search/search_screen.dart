import 'dart:io';
import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/util/custom_textfiled.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _queryTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    int offset = 1;
    // _scrollController.addListener(() async {
    //   if (_scrollController.position.maxScrollExtent ==
    //           _scrollController.position.pixels &&
    //       Get.find<SearchProvider>().productList.length != 0) {
    //     int pageSize = Get.find<SearchProvider>().pageTotal;

    //     if (offset < pageSize) {
    //       offset++;
    //       await Get.find<SearchProvider>().searchProducts(
    //         _queryTextController.text,
    //         page: offset,
    //       );
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor:
            Get.isDarkMode
                ? Theme.of(context).scaffoldBackgroundColor
                : Colors.white,
        title: CustomTextField(
          hinttext: 'search_item'.tr,
          controller: _queryTextController,
        ),
        actions: [
          GetBuilder<CartController>(
            builder: (cartController) {
              return SizedBox(
                width: Get.width / 11,
                child: IconButton(
                  padding: const EdgeInsets.only(
                    right: Dimensions.paddingSizeSmall,
                  ),
                  onPressed: () {
                    Get.to(CartScreen(isBackToExit: true));
                  },
                  icon: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        Images.cart,
                        width: Dimensions.iconSizeDefault,
                        height: Dimensions.iconSizeDefault,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      Positioned(
                        top: 5,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          child: Text(
                            '${cartController.cartItems.length}',
                            style: titilliumRegular.copyWith(
                              color: Colors.white,
                              fontSize: Dimensions.fontSizeExtraSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        color: Theme.of(context).cardColor,
        backgroundColor: Theme.of(context).primaryColor,
        onRefresh: () async {
          // return await Get.find<SearchProvider>().searchProducts(
          //   _queryTextController.text.trim(),
          // );
        },
        child: SizedBox(),
        //  GetBuilder<SearchProvider>(
        //   builder: (searchProvider) {
        //     if (searchProvider.isLoading) {
        //       return CustomLoader();
        //     }
        //     if (searchProvider.productList.length > 0) {
        //       return SingleChildScrollView(
        //         child: Padding(
        //           padding: const EdgeInsets.all(
        //             Dimensions.PADDING_SIZE_DEFAULT,
        //           ),
        //           child: GridView.builder(
        //             shrinkWrap: true,
        //             physics: NeverScrollableScrollPhysics(),
        //             itemCount: searchProvider.productList.length,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 0,
        //               mainAxisSpacing: 0,
        //               childAspectRatio: Platform.isIOS ? (1 / 1.3) : (1 / 1.4),
        //             ),
        //             itemBuilder: (BuildContext context, int index) {
        //               return ProductTileWidget(
        //                 searchProvider.productList[index],
        //                 isFromHome: true,
        //               );
        //             },
        //           ),
        //         ),
        //       );
        //     }

        //     return Center(
        //       child: Padding(
        //         padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        //         child: NoDataWidget(
        //           text:
        //               _queryTextController.text.isNotEmpty
        //                   ? 'results_not_found'.tr +
        //                       ' "${_queryTextController.text}"'
        //                   : 'no_data'.tr,
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
