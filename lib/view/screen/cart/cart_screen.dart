import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bunny_ngim_app/controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  final bool isBackToExit;
  const CartScreen({super.key, this.isBackToExit = false});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Get.find<CartController>().loadCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_cart'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          if (controller.cartItems.isEmpty) {
            return Center(
              child: NoInternetOrDataScreenWidget(
                isNoInternet: false,
                message: "cart_is_empty".tr,
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radiusSizeSmall,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(
                                  context,
                                ).hintColor.withValues(alpha: 0.2),
                                spreadRadius: 0,
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeExtraSmall,
                            horizontal: Dimensions.paddingSizeDefault,
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusSizeSmall,
                              ),
                              child: CustomImage(
                                image:
                                    item.product.imginfo != null
                                        ? item.product.imginfo!.filepath
                                        : '',
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),

                            title: Text(
                              item.product.title ?? 'No Name',
                              style: titilliumBold,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${'price'.tr}: ${item.product.priceformat}",
                                ),
                                Text("${'quantity'.tr}: ${item.quantity}"),
                              ],
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSizeExtraSmall,
                                ),
                                border: Border.all(
                                  color: Theme.of(context).hintColor,
                                ),
                                color: Theme.of(
                                  context,
                                ).hintColor.withValues(alpha: 0.3),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle,
                                      color:
                                          Theme.of(
                                            context,
                                          ).secondaryHeaderColor,
                                    ),
                                    onPressed: () {
                                      controller.updateQty(item.product, false);
                                    },
                                  ),
                                  Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () {
                                      controller.updateQty(item.product, true);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 10,
                        //   right: 20,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       controller.removeFromCart(item.product);
                        //     },
                        //     child: Icon(
                        //       Icons.delete_forever,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge,
                  vertical: Dimensions.paddingSizeLarge,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusSizeLarge),
                    topRight: Radius.circular(Dimensions.radiusSizeLarge),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${"total".tr}:',
                          style: titilliumBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          controller.totalPrice.toStringAsFixed(2),
                          style: titilliumBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    CustomButton(text: 'checkout'.tr),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
