import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
            child: SizedBox(
              height: 50,
              child: ClipOval(
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor.withValues(alpha: 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor: Colors.grey[300]!,
                    enabled: false,
                    child: SizedBox(),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   children: [
                    //     Container(
                    //       height: 70,
                    //       padding: const EdgeInsets.all(10),
                    //       decoration: BoxDecoration(
                    //         color: Theme.of(context).hintColor,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),

                    //     Padding(
                    //       padding: const EdgeInsets.all(10),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const SizedBox(
                    //             height: Dimensions.paddingSizeExtraSmall,
                    //           ),
                    //           Container(
                    //             height: 5,
                    //             color: Theme.of(context).cardColor,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
