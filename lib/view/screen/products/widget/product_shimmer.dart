import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  final bool isEnabled;
  final bool isHomePage;
  const ProductShimmer({
    super.key,
    required this.isEnabled,
    required this.isHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeSmall,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (1 / 1.7),
        ),
        itemCount: 12,
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // return Container(
          //   margin: const EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Theme.of(context).highlightColor),
          //   child: Shimmer.fromColors(
          //     baseColor: Theme.of(context).cardColor,
          //     highlightColor: Colors.grey[300]!,
          //     enabled: false,
          //     child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           Expanded(
          //             flex: 6,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: ColorResources.iconBg(),
          //                 borderRadius: const BorderRadius.only(
          //                     topLeft: Radius.circular(10),
          //                     topRight: Radius.circular(10)),
          //               ),
          //             ),
          //           ),

          //           // Product Details
          //           Expanded(
          //             flex: 4,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.all(Dimensions.paddingSizeSmall),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(height: 20, color: Colors.white),
          //                   const SizedBox(
          //                       height: Dimensions.paddingSizeExtraSmall),
          //                   Row(children: [
          //                     Expanded(
          //                       child: Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Container(
          //                                 height: 20,
          //                                 width: 50,
          //                                 color: Colors.white),
          //                           ]),
          //                     ),
          //                     Container(
          //                         height: 10, width: 50, color: Colors.white),
          //                     const Icon(Icons.star,
          //                         color: Colors.orange, size: 15),
          //                   ]),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ]),
          //   ),
          // );

          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).highlightColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Theme.of(context).hintColor.withOpacity(0.2),
                    highlightColor: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ).withOpacity(0.1),
                    enabled: false,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: ColorResources.getTextBg(context),
                    //   borderRadius: const BorderRadius.only(
                    //       bottomLeft: Radius.circular(10),
                    //       bottomRight: Radius.circular(10)),
                    // ),
                    child: Shimmer.fromColors(
                      baseColor: Theme.of(context).hintColor.withOpacity(0.2),
                      highlightColor: const Color.fromARGB(
                        255,
                        255,
                        255,
                        255,
                      ).withOpacity(0.1),
                      enabled: false,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                Dimensions.paddingSizeSmall,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(height: 20, color: Colors.white),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeExtraSmall,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 50,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 10,
                                        width: 50,
                                        color: Colors.white,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
