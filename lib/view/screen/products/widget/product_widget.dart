import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  final Product productModel;
  final int productNameLine;
  const ProductWidget({
    super.key,
    required this.productModel,
    this.productNameLine = 2,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLtr = false;

    return GetBuilder<ConfigController>(
      builder: (configController) {
        return InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     PageRouteBuilder(
            //         transitionDuration: const Duration(milliseconds: 1000),
            //         pageBuilder: (context, anim1, anim2) => ProductDetails(
            //             productId: productModel.id, slug: productModel.slug)));
          },
          child: Container(
            margin: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
              border: Border.all(
                color: Theme.of(context).primaryColor.withValues(alpha: .10),
                width: 1,
              ),
              color: Theme.of(context).highlightColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(9, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LayoutBuilder(
                        builder:
                            (context, boxConstraint) => ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  Dimensions.radiusSizeDefault,
                                ),
                                topRight: Radius.circular(
                                  Dimensions.radiusSizeDefault,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.paddingSizeSmall,
                                      ),
                                      border: Border.all(
                                        color: Theme.of(
                                          context,
                                        ).primaryColor.withValues(alpha: .10),
                                        width: 1,
                                      ),
                                      color: Theme.of(context).highlightColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context).primaryColor
                                              .withValues(alpha: 0.05),
                                          spreadRadius: 0,
                                          blurRadius: 10,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(
                                      left: Dimensions.paddingSizeSmall,
                                      top: Dimensions.paddingSizeSmall,
                                      right: Dimensions.paddingSizeSmall,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.paddingSizeDefault,
                                      ),
                                      child: CustomImage(
                                        image:
                                            '${configController.filePath}/${productModel.imginfo!.fileName}',
                                        fit: BoxFit.cover,
                                        height: boxConstraint.maxWidth * 0.82,
                                        width: boxConstraint.maxWidth,
                                      ),
                                    ),
                                  ),
                                  // if (productModel.currentStock! == 0 &&
                                  //     productModel.productType == 'item') ...[
                                  //   Container(
                                  //     height: boxConstraint.maxWidth * 0.82,
                                  //     width: boxConstraint.maxWidth,
                                  //     color: Colors.black.withValues(alpha: 0.4),
                                  //   ),
                                  //   Positioned.fill(
                                  //     child: Align(
                                  //       alignment: Alignment.bottomCenter,
                                  //       child: Container(
                                  //         width: boxConstraint.maxWidth,
                                  //         decoration: BoxDecoration(
                                  //           color: Theme.of(context)
                                  //               .colorScheme
                                  //               .error
                                  //               .withValues(alpha: 0.4),
                                  //           borderRadius: const BorderRadius.only(
                                  //             topLeft: Radius.circular(
                                  //               Dimensions.radiusSizeSmall,
                                  //             ),
                                  //             topRight: Radius.circular(
                                  //               Dimensions.radiusSizeSmall,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         child: Text(
                                  //           getTranslated(
                                  //                 'out_of_stock',
                                  //                 context,
                                  //               ) ??
                                  //               '',
                                  //           style: textBold.copyWith(
                                  //             color: Colors.white,
                                  //             fontSize: Dimensions.fontSizeSmall,
                                  //           ),
                                  //           textAlign: TextAlign.center,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ],
                                ],
                              ),
                            ),
                      ),

                      // Product Details
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                            // if (ratting > 0)
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       const Icon(
                            //         Icons.star_rate_rounded,
                            //         color: Colors.orange,
                            //         size: 20,
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //           horizontal: 2.0,
                            //         ),
                            //         child: Text(
                            //           ratting.toStringAsFixed(1),
                            //           style: textRegular.copyWith(
                            //             fontSize: Dimensions.fontSizeDefault,
                            //           ),
                            //         ),
                            //       ),
                            //       Text(
                            //         '(${productModel.reviewCount.toString()})',
                            //         style: textRegular.copyWith(
                            //           fontSize: Dimensions.fontSizeSmall,
                            //           color: Theme.of(context).hintColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: Dimensions.paddingSizeSmall,
                              ),
                              child: Text(
                                productModel.title ?? '',
                                textAlign: TextAlign.center,
                                style: titilliumBold.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                ),
                                maxLines: productNameLine,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // ((productModel.discount != null &&
                            //             productModel.discount! > 0) ||
                            //         (productModel.clearanceSale?.discountAmount ??
                            //                 0) >
                            //             0)
                            //     ? Text(
                            //       PriceConverter.convertPrice(
                            //         context,
                            //         productModel.unitPrice,
                            //       ),
                            //       style: titleRegular.copyWith(
                            //         color: Theme.of(context).hintColor,
                            //         decoration: TextDecoration.lineThrough,
                            //         fontSize: Dimensions.fontSizeSmall,
                            //       ),
                            //     )
                            //     : const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.all(
                                Dimensions.paddingSizeExtraSmall,
                              ),
                              child: Text(
                                '${productModel.priceformat!}/${productModel.unit}',

                                style: titilliumBold.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Off
                // ((productModel.discount! > 0) ||
                //         (productModel.clearanceSale != null))
                //     ? DiscountTagWidget(productModel: productModel)
                //     : const SizedBox.shrink(),
                // Positioned(
                //   top: 18,
                //   right: isLtr ? 16 : null,
                //   left: !isLtr ? 16 : null,
                //   child: FavouriteButtonWidget(
                //     backgroundColor: ColorResources.getImageBg(context),
                //     productId: productModel.id,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
