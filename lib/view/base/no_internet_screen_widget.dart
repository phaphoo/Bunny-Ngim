import 'package:bunny_ngim_app/util/custom_button.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class NoInternetOrDataScreenWidget extends StatelessWidget {
  final bool isNoInternet;
  final Widget? child;
  final String? message;
  final String? icon;
  final bool icCart;
  const NoInternetOrDataScreenWidget({
    super.key,
    required this.isNoInternet,
    this.child,
    this.message,
    this.icon,
    this.icCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isNoInternet
                  ? Images.noInternet
                  : icon != null
                  ? icon!
                  : Images.noData,
              width: 75,
            ),
            if (isNoInternet)
              Text(
                'OPPS'.tr,
                style: titilliumBold.copyWith(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),

            const SizedBox(height: Dimensions.paddingSizeDefault),
            Text(
              isNoInternet
                  ? 'no_internet_connection'.tr
                  : message != null
                  ? message!.tr
                  : 'no_data_found'.tr,
              textAlign: TextAlign.center,
              style: titilliumRegular.copyWith(),
            ),
            const SizedBox(height: 20),
            isNoInternet
                ? Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (await Connectivity().checkConnectivity() !=
                          ConnectivityResult.none) {
                        Navigator.pushReplacement(
                          Get.context!,
                          MaterialPageRoute(builder: (_) => child!),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'RETRY'.tr,
                        style: titilliumSemiBold.copyWith(
                          color: Theme.of(context).highlightColor,
                          fontSize: Dimensions.fontSizeLarge,
                        ),
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink(),

            if (icCart)
              SizedBox(
                width: 160,
                child: CustomButton(
                  onTap:
                      () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DashboardScreen(),
                        ),
                        (route) => false,
                      ),

                  text: 'continue_shopping'.tr,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
