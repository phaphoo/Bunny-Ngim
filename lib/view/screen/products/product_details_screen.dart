import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_bottom_view.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_screen.dart';
import 'package:bunny_ngim_app/view/screen/products/related_product_view.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/favourite_button_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_details_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final int? productId;
  final bool isFromWishList;
  final Product productDetailsModel;
  const ProductDetails({
    super.key,
    required this.productId,
    this.isFromWishList = false,
    required this.productDetailsModel,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  _loadData(BuildContext context, bool reload) async {
    // Provider.of<TopSellerProvider>(Get.context!, listen: false).getModule(reload);
  }

  @override
  void initState() {
    _loadData(context, true);
    super.initState();
  }

  void showMiniProductBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => MiniProductBottomSheet(product: product),
    );
  }

  bool isReview = false;
  bool isContentVisible = false;
  bool isContentVisibleDescription = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // CustomeHeader(titleName: '', action: null),
          SliverToBoxAdapter(
            child: Column(
              children: [
                GetBuilder<ProductController>(
                  builder: (topSellerProvider) {
                    return GetBuilder<ProductController>(
                      builder: (details) {
                        return Stack(
                          children: [
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child:
                                  !details.filterFirstLoading
                                      ? Column(
                                        children: [
                                          ProductImageView(
                                            productModel:
                                                widget.productDetailsModel,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 5.0,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).hoverColor,
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              Dimensions
                                                                  .paddingSizeDefault,
                                                            ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                color:
                                                                    Theme.of(
                                                                      context,
                                                                    ).cardColor,
                                                              ),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '${widget.productDetailsModel.title}',
                                                                    style: titilliumBold.copyWith(
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeLarge,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height:
                                                                    Dimensions
                                                                        .paddingSizeDefault,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '${widget.productDetailsModel.pricing['dfpricing']}/${widget.productDetailsModel.unit}',
                                                                    style: titilliumRegular.copyWith(
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeLarge,
                                                                      color:
                                                                          Theme.of(
                                                                            context,
                                                                          ).colorScheme.error,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(
                                                        Dimensions
                                                            .paddingSizeDefault,
                                                      ),
                                                      child: FavouriteButtonWidget(
                                                        isFeatured: true,
                                                        product:
                                                            widget
                                                                .productDetailsModel,
                                                        backgroundColor:
                                                            Theme.of(
                                                              context,
                                                            ).hintColor,
                                                        productId:
                                                            widget
                                                                .productDetailsModel
                                                                .id,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // ProductTitleView(
                                                //   productModel:
                                                //       widget
                                                //           .productDetailsModel,
                                                //   averageRatting:
                                                //       details
                                                //                   .productDetailsModel
                                                //                   ?.averageReview !=
                                                //               null
                                                //           ? details
                                                //               .productDetailsModel!
                                                //               .averageReview
                                                //           : "0",
                                                // ),
                                                Container(
                                                  height: 5.0,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).hoverColor,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(
                                                        Dimensions
                                                            .paddingSizeDefault,
                                                      ),
                                                      child: Text(
                                                        "description".tr,
                                                        style: titilliumBold
                                                            .copyWith(
                                                              fontSize:
                                                                  Dimensions
                                                                      .fontSizeLarge,
                                                            ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          isContentVisibleDescription =
                                                              !isContentVisibleDescription;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              20.0,
                                                            ),
                                                        child: Icon(
                                                          isContentVisibleDescription
                                                              ? Icons
                                                                  .keyboard_arrow_up
                                                              : Icons
                                                                  .keyboard_arrow_down,
                                                          // Choose the appropriate icon based on content visibility
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                isContentVisibleDescription
                                                    ? Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            left:
                                                                Dimensions
                                                                    .paddingSizeDefault,
                                                            bottom:
                                                                Dimensions
                                                                    .paddingSizeDefault,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                width:
                                                                    MediaQuery.of(
                                                                      context,
                                                                    ).size.width -
                                                                    40,
                                                                child:
                                                                    // ignore: unnecessary_null_comparison
                                                                    widget.productDetailsModel !=
                                                                            null
                                                                        ? Text(
                                                                          widget
                                                                              .productDetailsModel
                                                                              .title
                                                                              .toString(),
                                                                          style: titilliumRegular.copyWith(
                                                                            color:
                                                                                Theme.of(
                                                                                  context,
                                                                                ).hintColor,
                                                                            fontSize:
                                                                                Dimensions.fontSizeDefault,
                                                                          ),
                                                                          maxLines:
                                                                              200,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        )
                                                                        : const SizedBox(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                    : const SizedBox(),

                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 5.0,
                                                      color:
                                                          Theme.of(
                                                            context,
                                                          ).hoverColor,
                                                    ),
                                                    const SizedBox(
                                                      height:
                                                          Dimensions
                                                              .paddingSizeDefault,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal:
                                                                Dimensions
                                                                    .paddingSizeExtraSmall,
                                                            vertical:
                                                                Dimensions
                                                                    .paddingSizeExtraSmall,
                                                          ),
                                                          child: TitleWidget(
                                                            title:
                                                                'related_product'
                                                                    .tr,
                                                          ),
                                                        ),
                                                        // ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal:
                                                                    Dimensions
                                                                        .paddingSizeDefault,
                                                              ),
                                                          child:
                                                              RelatedProductView(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                      : const ProductDetailsShimmer(),
                            ),
                            Positioned(
                              top: 10,
                              left: Dimensions.paddingSizeSmall,
                              child: SafeArea(
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.radiusSizeDefault,
                                      ),
                                      color: Theme.of(context).cardColor,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: GetPlatform.isIOS ? 5 : 5,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: Dimensions.iconSizeLarge,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: Dimensions.paddingSizeSmall,
                              child: SafeArea(
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.radiusSizeDefault,
                                    ),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: IconButton(
                                    onPressed:
                                        () => Get.to(
                                          () => const CartScreen(
                                            isBackToExit: true,
                                          ),
                                        ),
                                    icon: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Image.asset(
                                          Images.cart,
                                          height: Dimensions.iconSizeLarge,
                                          width: Dimensions.iconSizeLarge,
                                          color: ColorResources.black,
                                        ),
                                        Positioned(
                                          top: -4,
                                          right: -4,
                                          child: GetBuilder<CartController>(
                                            builder: (cart) {
                                              return CircleAvatar(
                                                radius: 7,
                                                backgroundColor:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.error,
                                                child: Text(
                                                  cart.cartItems.length
                                                      .toString(),
                                                  style: titilliumSemiBold.copyWith(
                                                    color: ColorResources.white,
                                                    fontSize:
                                                        Dimensions
                                                            .fontSizeExtraSmall,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 1,
              color: Theme.of(context).primaryColor.withOpacity(.125),
            ),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radiusSizeLarge),
            topRight: Radius.circular(Dimensions.radiusSizeLarge),
          ),
        ),
        height: Get.width / 5.5,
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: CustomButton(
            text: 'add_to_cart'.tr,
            onTap: () {
              showMiniProductBottomSheet(context, widget.productDetailsModel);
            },
          ),
        ),
      ),
      // bottomNavigationBar: Consumer<ProductDetailsProvider>(
      //   builder: (context, details, child) {
      //     return !details.isDetails
      //         ? BottomCartView(
      //           product: details.productDetailsModel,
      //           sellerId:
      //               details.productDetailsModel != null
      //                   ? details.productDetailsModel!.userId.toString()
      //                   : '',
      //         )
      //         : const SizedBox();
      //   },
      // ),
    );
  }
}
