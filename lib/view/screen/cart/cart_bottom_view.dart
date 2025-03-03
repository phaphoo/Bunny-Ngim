import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/controller/cart_controller.dart';

class MiniProductBottomSheet extends StatefulWidget {
  final Product product;

  const MiniProductBottomSheet({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _MiniProductBottomSheetState createState() => _MiniProductBottomSheetState();
}

class _MiniProductBottomSheetState extends State<MiniProductBottomSheet> {
  int quantity = 1;
  double totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = double.parse(widget.product.dfpricing.toString() ?? '0');
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimensions.radiusSizeDefault,
                ),
                child: CustomImage(
                  image: widget.product.imginfo?.filepath ?? '',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title ?? '',
                      style: titilliumBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.product.priceformat}/${widget.product.unit}',
                      style: titilliumBold.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.paddingSizeLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() => quantity--);
                        totalPrice =
                            double.parse(widget.product.dfpricing ?? '0') *
                            quantity;
                      }
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: titilliumBold.copyWith(
                      fontSize: Dimensions.fontSizeLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed:
                        () => setState(() {
                          quantity++;
                          totalPrice =
                              double.parse(widget.product.dfpricing ?? '0') *
                              quantity;
                        }),
                    icon: Icon(
                      Icons.add_circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Text(
            '${'total'.tr}: ${totalPrice.toStringAsFixed(2)}',
            style: titilliumBold.copyWith(
              fontSize: Dimensions.fontSizeLarge + 2,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeDefault),
          CustomButton(
            onTap: () {
              cartController.addToCart(widget.product, qty: quantity);
              Get.back();
            },
            text: 'add_to_cart'.tr,
          ),
          SizedBox(height: Dimensions.paddingSizeSmall),
        ],
      ),
    );
  }
}
