import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/products/product_details_screen.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/add_to_cart_button_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/favourite_button_widget.dart';
import 'package:flutter/material.dart';

class FeaturedDealWidget extends StatelessWidget {
  final Product product;
  final bool isHomePage;
  final bool? isCenterElement;
  const FeaturedDealWidget({
    super.key,
    required this.product,
    required this.isHomePage,
    this.isCenterElement,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => ProductDetails(
                  productId: product.id,
                  productDetailsModel: product,
                ),
          ),
        );
      },

      child: LayoutBuilder(
        builder: (context, constrains) {
          return AnimatedContainer(
            margin:
                isCenterElement == null
                    ? null
                    : EdgeInsets.symmetric(vertical: isCenterElement! ? 0 : 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            duration: const Duration(milliseconds: 600),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.paddingSizeSmall,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimensions.paddingSizeSmall,
                        ),
                        child: CustomImage(
                          image: '${product.imginfo?.filepath}',
                          height: constrains.maxHeight * 0.6,
                          width: constrains.maxHeight * 0.7,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    product.title ?? '',
                                    style: titilliumRegular.copyWith(
                                      fontSize: Dimensions.fontSizeLarge,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                const SizedBox(
                                  width: Dimensions.paddingSizeDefault,
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeSmall),

                            FittedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${product.pricing!}/${product.unit}',

                                    style: titilliumBold.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: Dimensions.fontSizeLarge,
                                    ),
                                  ),

                                  const SizedBox(
                                    width: Dimensions.paddingSizeSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  bottom: 10,
                  right: 10,
                  child: AddToCartButtonWidget(
                    isFeatured: true,
                    product: product,
                    backgroundColor: Theme.of(context).hintColor,
                    productId: product.id,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
