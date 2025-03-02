import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/add_to_cart_button_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/favourite_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListTileWidget extends StatelessWidget {
  final Product productModel;
  final int productNameLine;
  const ProductListTileWidget({
    super.key,
    required this.productModel,
    this.productNameLine = 2,
  });

  @override
  Widget build(BuildContext context) {
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
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            child: Container(
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 2.6,
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
                                    color: Theme.of(
                                      context,
                                    ).primaryColor.withValues(alpha: 0.05),
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

                Positioned(
                  top: 18,
                  right: 16,
                  child: FavouriteButtonWidget(
                    product: productModel,
                    backgroundColor: Theme.of(context).hintColor,
                    productId: productModel.id,
                  ),
                ),

                Positioned(
                  top: 50,
                  right: 16,
                  child: AddToCartButtonWidget(
                    product: productModel,
                    backgroundColor: Theme.of(context).hintColor,
                    productId: productModel.id,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
