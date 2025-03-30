import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/model/response/cart_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/cart/widget/cart_quantity_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartWidget extends StatelessWidget {
  final CartItem? cartModel;
  final int index;
  final bool fromCheckout;
  final String produtQty;
  const CartWidget({
    super.key,
    this.cartModel,
    required this.index,
    required this.fromCheckout,
    required this.produtQty,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartProvider) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingSizeSmall,
            Dimensions.paddingSizeSmall,
            Dimensions.paddingSizeSmall,
            0,
          ),
          child: Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              extentRatio: .25,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (value) {
                    cartProvider.removeFromCart(cartModel!.product);
                  },
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.error.withValues(alpha: .05),
                  foregroundColor: Theme.of(context).colorScheme.error,
                  icon: CupertinoIcons.delete_solid,
                  label: 'delete'.tr,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.paddingSizeExtraSmall,
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.15),
                  width: .75,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  Expanded(
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeSmall,
                              horizontal: 0,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.paddingSizeExtraSmall,
                                    ),
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).primaryColor.withValues(alpha: .10),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.paddingSizeExtraSmall,
                                    ),
                                    child: CustomImage(
                                      image:
                                          cartModel?.product.imginfo != null
                                              ? '${cartModel?.product.imginfo!.filepath}'
                                              : '',
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeSmall,
                                vertical: Dimensions.paddingSizeSmall,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          cartModel!.product.title!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: titilliumRegular.copyWith(
                                            fontSize: Dimensions.fontSizeLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Dimensions.paddingSizeSmall,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeSmall,
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        '${cartModel!.product.pricing['dfpricing']}/${cartModel!.product.barcode!}',

                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: titilliumBold.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSizeLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor.withValues(alpha: .05),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: .075),
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(
                                  Dimensions.paddingSizeExtraSmall,
                                ),
                                topRight: Radius.circular(
                                  Dimensions.paddingSizeExtraSmall,
                                ),
                              ),
                            ),
                            width: 40,

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeSmall,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CartQuantityButton(
                                    isIncrement: true,
                                    quantity: cartModel!.quantity,

                                    cartModel: cartModel,
                                  ),
                                  Text(
                                    produtQty.toString(),
                                    style: titilliumRegular,
                                  ),
                                  CartQuantityButton(
                                    isIncrement: false,

                                    quantity: cartModel!.quantity,

                                    cartModel: cartModel,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
