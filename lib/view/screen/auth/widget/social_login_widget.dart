import 'package:bunny_ngim_app/controller/google_sign_in_controller.dart';
import 'package:bunny_ngim_app/model/response/auth_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthModel authModel = AuthModel();

    List<Widget> socialList = [
      InkWell(
        onTap: () async {
          await Get.find<GoogleSignInController>().login();

          authModel.email =
              Get.find<GoogleSignInController>().googleAccount.email;

          authModel.uid = Get.find<GoogleSignInController>().googleAccount.id;
          authModel.name =
              Get.find<GoogleSignInController>().googleAccount.displayName;
          authModel.mobile = authModel.uid;

          // await Get.find<AuthProvider>().getUser(authModel.uid!);

          // if (Get.find<AuthProvider>().isLoggedIn()) {
          //   // Get.to(ChooseLocationScreen());
          //   // Get.find<LocationProvider>()
          //   //     .switchLocation(Get.find<LocationProvider>().locationList[0]);
          //   Get.find<MainProvider>().changeIndex(index: 0);
          //   Get.offAll(MainScreen());
          // } else {
          //   await Get.find<AuthProvider>().register(authModel);
          //   // Get.to(ChooseLocationScreen());
          //   // Get.find<LocationProvider>().switchLocation(Get.find<LocationProvider>().locationList[0]);
          //   Get.find<MainProvider>().changeIndex(index: 0);
          //   Get.offAll(MainScreen());
          // }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              Dimensions.radiusSizeExtraSmall,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeSmall + 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.google, width: 20, height: 20),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Text('sign_in_with_google'.tr, style: titilliumRegular),
              ],
            ),
          ),
        ),
      ),
      // SizedBox(height: Dimensions.paddingSizeDefault),
      // InkWell(
      //   onTap: () async {
      //     await Get.find<FacebookLoginController>().login();

      //     authModel.name = Get.find<FacebookLoginController>().userData['name'];

      //     authModel.uid =
      //         Get.find<FacebookLoginController>().result.accessToken!.userId;
      //     authModel.email =
      //         Get.find<FacebookLoginController>().userData['email'] ??
      //         authModel.uid;
      //     authModel.mobile = authModel.uid;

      //     // authModel.image = Get.find<FacebookLoginController>()
      //     //     .userData['picture']['data']['url'];
      //     // await Get.find<AuthProvider>().getUser(authModel.uid!);
      //     // if (Get.find<AuthProvider>().isLoggedIn()) {
      //     //   // Get.to(ChooseLocationScreen());
      //     //   // Get.find<LocationProvider>().switchLocation(Get.find<LocationProvider>().locationList[0]);
      //     //   Get.find<MainProvider>().changeIndex(index: 0);
      //     //   Get.offAll(MainScreen());
      //     // } else {
      //     //   await Get.find<AuthProvider>().register(authModel);
      //     //   // Get.to(ChooseLocationScreen());
      //     //   // Get.find<LocationProvider>().switchLocation(Get.find<LocationProvider>().locationList[0]);
      //     //   Get.find<MainProvider>().changeIndex(index: 0);
      //     //   Get.offAll(MainScreen());
      //     // }
      //   },
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Theme.of(context).hintColor.withOpacity(0.2),
      //       borderRadius: BorderRadius.circular(
      //         Dimensions.radiusSizeExtraSmall,
      //       ),
      //     ),
      //     child: Padding(
      //       padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Image.asset(Images.facebook, width: 25, height: 25),
      //           const SizedBox(width: Dimensions.paddingSizeSmall),
      //           Text('sign_in_with_facebook'.tr, style: titilliumRegular),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(
                        context,
                        // ignore: deprecated_member_use
                      ).primaryColor.withOpacity(0.1),
                    ],
                    end: Alignment.centerLeft,
                    begin: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Text("or".tr, style: TextStyle(color: Colors.blueGrey)),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(
                        context,
                        // ignore: deprecated_member_use
                      ).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor,
                    ],
                    end: Alignment.bottomCenter,
                    begin: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: socialList,
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraLarge),

        InkWell(
          onTap: () => Get.offAll(() => DashBoardScreen()),
          child: Text('skip_for_now'.tr, style: titilliumRegular),
        ),
      ],
    );
  }
}
