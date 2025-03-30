import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/model/response/category_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/screen/category/category_products_view.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatefulWidget {
  final CategoryModel? category;
  final bool isBackToExit;
  const CategoryProductsScreen({
    super.key,
    this.category,
    this.isBackToExit = false,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  bool isLast = false;
  var totalPrice = 0.0;
  List image = [];
  final ScrollController _scrollController = ScrollController();

  int categoryIndex = 0;
  int offset = 1;
  String cateId = '';

  load() async {
    Future.delayed(Duration.zero, () async {
      if (widget.category != null) {
        categoryIndex = Get.find<CategoryController>().categoryList!.indexOf(
                  widget.category!,
                ) +
            1;
        await Get.find<CategoryController>().getProductByCateData(
          widget.category!.id.toString(),
        );
      } else {
        categoryIndex = 0;
        await Get.find<CategoryController>().getProductByCateData('');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    load();
    if (categoryIndex != -1) {
      categoryIndex++;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'category'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          return GetBuilder<CategoryController>(
            builder: (categoryController) {
              return Column(
                children: [
                  SizedBox(height: Dimensions.paddingSizeSmall),
                  SizedBox(
                    height: Dimensions.paddingSizeOverLarge - 10,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: Dimensions.paddingSizeSmall),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                              Dimensions.paddingSizeExtraExtraSmall,
                            ),
                            color: categoryIndex == 0
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).cardColor,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeDefault - 11,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                categoryIndex = 0;
                                cateId = '';
                                categoryController.getProductByCateData('');
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeExtraLarge,
                              ),
                              child: Center(
                                child: Text(
                                  "all".tr,
                                  style: titilliumBold.copyWith(
                                    color: categoryIndex == 0
                                        ? Colors.white
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (categoryController.categoryList != null)
                          ...categoryController.categoryList!.map((category) {
                            var index = categoryController.categoryList!
                                .indexOf(category);
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.paddingSizeExtraExtraSmall,
                                ),
                                color: categoryIndex == (index + 1)
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).cardColor,
                              ),
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeDefault - 11,
                              ),
                              child: InkWell(
                                onTap: () {
                                  categoryController.getProductByCateData(
                                    category.id!.toString(),
                                  );

                                  setState(() {
                                    cateId = category.id!.toString();
                                    categoryIndex = index + 1;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSizeDefault,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        category.title!,
                                        style: titilliumBold.copyWith(
                                          color: categoryIndex == (index + 1)
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        SizedBox(width: Dimensions.paddingSizeSmall),
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Expanded(
                    child: RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      onRefresh: () async {
                        if (categoryIndex == 0) {
                          categoryController.getProductByCateData('');
                        } else {
                          categoryController.getProductByCateData(
                            categoryController
                                .categoryList![categoryIndex - 1].id!
                                .toString(),
                          );
                        }
                        return;
                      },
                      child: !categoryController.filterFirstLoading
                          ? categoryController.productList!.isNotEmpty
                              ? SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeSmall,
                                    ),
                                    child: CategoryProductView(
                                      cateId: cateId,
                                      isHomePage: false,
                                      scrollController: _scrollController,
                                    ),
                                  ),
                                )
                              : NoInternetOrDataScreenWidget(
                                  isNoInternet: false,
                                )
                          : ProductShimmer(
                              isEnabled: true,
                              isHomePage: false,
                            ),
                    ),
                  ),
                  SizedBox(height: Dimensions.paddingSizeDefault),
                ],
              );
            },
          );
        },
      ),

      // bottomNavigationBar: GetBuilder<CartProvider>(builder: (cartProvider) {
      //   return Container(
      //     height: 100,
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).cardColor,
      //       boxShadow: Get.isDarkMode
      //           ? null
      //           : [
      //               BoxShadow(
      //                 offset: const Offset(0, -2),
      //                 blurRadius: 5,
      //                 color: Colors.grey.shade200,
      //               )
      //             ],
      //       borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         topRight: Radius.circular(20),
      //       ),
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      //       child: Row(
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const SizedBox(height: 10),
      //               Text(
      //                 'total'.tr,
      //                 style: titilliumBold.copyWith(
      //                   color: Get.isDarkMode ? Colors.white : Colors.black,
      //                   fontSize: Dimensions.fontSizeExtraLarge,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //               const SizedBox(height: 5),
      //               Text(
      //                 ' \$ ${cartProvider.mycart2.getTotalAmount().toStringAsFixed(2)}',
      //                 style: titilliumBold.copyWith(
      //                   color: Theme.of(context).primaryColor,
      //                   fontSize: Dimensions.fontSizeExtraLarge,
      //                   fontWeight: FontWeight.w500,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           const Spacer(),
      //           GestureDetector(
      //             onTap: () {
      //               if (cartProvider.mycart2.getCartItemCount() == 0) {
      //               } else {
      //                 Get.to(ProductPickScheduleScreen(
      //                   // cartmodel: cartItem.productDetails,
      //                   imageList: image,
      //                   cartlist: cartProvider.mycart.cartItem,
      //                 ));
      //                 // Get.to(() => CheckoutScreen(
      //                 //       imageList: image,
      //                 //     ));
      //               }
      //             },
      //             child: Container(
      //               height: 50,
      //               width: 150,
      //               decoration: BoxDecoration(
      //                 color: Theme.of(context).colorScheme.secondary,
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   'book_now'.tr,
      //                   style: titilliumBold.copyWith(
      //                     color: Colors.white,
      //                     fontSize: Dimensions.fontSizeExtraLarge,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // }),
    );
  }
}
