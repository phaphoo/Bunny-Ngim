import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageView extends StatelessWidget {
  final Product productModel;
  ProductImageView({super.key, required this.productModel});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap:
              () => Get.to(
                ProductImageScreen(
                  title: 'product_image'.tr,
                  imageList: [productModel.imginfo!.filepath],
                ),
              ),
          child:
              productModel.imginfo!.filepath.isNotEmpty
                  ? ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(
                          Dimensions.paddingSizeSmall,
                        ),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child:
                                productModel.imginfo!.filepath.isNotEmpty
                                    ? PageView.builder(
                                      controller: _controller,
                                      itemCount:
                                          productModel.imginfo!.filepath.length,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          child: CustomImage(
                                            height:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width,
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width,
                                            image:
                                                productModel.imginfo!.filepath,
                                          ),
                                        );
                                      },
                                      onPageChanged: (index) {
                                        // Provider.of<ProductDetailsProvider>(
                                        //   context,
                                        //   listen: false,
                                        // ).setImageSliderSelectedIndex(index);
                                      },
                                    )
                                    : const SizedBox(),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(),
                                const Spacer(),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: _indicators(context),
                                // ),
                                // const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : const SizedBox(),
        ),
      ],
    );
  }

  // List<Widget> _indicators(BuildContext context) {
  //   List<Widget> indicators = [];
  //   for (int index = 0; index < productModel!.images!.length; index++) {
  //     indicators.add(Padding(
  //       padding: const EdgeInsets.symmetric(
  //           horizontal: Dimensions.paddingSizeExtraExtraSmall),
  //       child: Container(
  //         width: index ==
  //                 Provider.of<ProductDetailsProvider>(context).imageSliderIndex
  //             ? 20
  //             : 6,
  //         height: 6,
  //         decoration: BoxDecoration(
  //           color: index ==
  //                   Provider.of<ProductDetailsProvider>(context)
  //                       .imageSliderIndex
  //               ? Theme.of(context).primaryColor
  //               : Theme.of(context).hintColor,
  //         ),
  //       ),
  //     ));
  //   }
  //   return indicators;
  // }
}
