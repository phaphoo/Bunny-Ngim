import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/products/product_details_screen.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/add_to_cart_button_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/favourite_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderProductWidget extends StatelessWidget {
  final Product product;
  final bool isCurrentIndex;
  const SliderProductWidget({
    super.key,
    required this.product,
    this.isCurrentIndex = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ProductDetails(
            productId: product.id,
            productDetailsModel: product,
          ),
        );
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          vertical: isCurrentIndex ? Dimensions.paddingSizeExtraSmall : 45,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: Theme.of(context).cardColor,
          // border: Border.all(color: Theme.of(context).colorScheme.onTertiary),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        // curve: Curves.easeInCubic,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: LayoutBuilder(
                      builder: (context, constrains) {
                        return Stack(
                          children: [
                            Container(
                              width: constrains.maxWidth,
                              height: constrains.maxWidth * 0.9,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Theme.of(
                                //     context,
                                //   ).primaryColor.withValues(alpha: .1),
                                // ),
                                color: Theme.of(context).hintColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    CustomImage(
                                      image: '${product.imginfo?.filepath}',
                                      width: constrains.maxWidth,
                                      height: constrains.maxWidth * 0.9,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: 10,
                              right: 10,
                              child: FavouriteButtonWidget(
                                isFeatured: true,
                                product: product,
                                backgroundColor: Theme.of(context).hintColor,
                                productId: product.id,
                              ),
                            ),

                            Positioned(
                              top: 55,
                              right: 10,
                              child: AddToCartButtonWidget(
                                isFeatured: true,
                                product: product,
                                backgroundColor: Theme.of(context).hintColor,
                                productId: product.id,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  if (isCurrentIndex)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall,
                          ),
                          child: Text(
                            product.title!,
                            style: titilliumRegular.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeExtraSmall,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${product.pricing != null
                                  ? product.pricing is int
                                      ? product.pricing
                                      : product.pricing['dfpricing']!
                                  : 0}/${product.unit}',
                              style: titilliumBold.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Positioned(
//   top: Dimensions.paddingSizeDefault,
//   child: Container(
//     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       color: ColorResources.getPrimary(context),
//       borderRadius: BorderRadius.only(
//         topRight: isLtr ? const Radius.circular(5) : Radius.zero,
//         bottomRight: isLtr ? const Radius.circular(5) : Radius.zero,
//         topLeft: !isLtr ? const Radius.circular(5) : Radius.zero,
//         bottomLeft: !isLtr ? const Radius.circular(5) : Radius.zero,
//       ),
//     ),
//     child: Directionality(
//       textDirection: TextDirection.ltr,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
//         child: Text(
//           PriceConverter.percentageCalculation(context, product.unitPrice, product.discount, product.discountType),
//           style: textBold.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.fontSizeExtraSmall),
//         ),
//       ),
//     ),
//   ),
// ),