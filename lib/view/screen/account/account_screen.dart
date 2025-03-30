import 'dart:convert';

import 'package:bunny_ngim_app/helper/html_view_screen.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/logout_confirm_bottom_sheet.dart';
import 'package:bunny_ngim_app/view/dashboard/dashboard_screen.dart';
import 'package:bunny_ngim_app/view/screen/account/more_header_section.dart';
import 'package:bunny_ngim_app/view/screen/auth/login_screen.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_screen.dart';
import 'package:bunny_ngim_app/view/screen/contactus/contact_us_screen.dart';
import 'package:bunny_ngim_app/view/screen/favorite/favorite_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/event/event_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/event/news_and_event_detail_screen.dart';
import 'package:bunny_ngim_app/view/screen/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  final bool isBackToExit;
  const AccountScreen({super.key, this.isBackToExit = true});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late bool isGuestMode;
  late bool showUserWallet;
  String? version;
  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MoreHeaderSection(),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        Dimensions.paddingSizeExtraExtraSmall,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Dimensions.paddingSizeLarge),
                          TitleButton(
                            image: Images.homePage,
                            title: 'home'.tr,
                            isHomePage: true,
                            navigateTo: DashBoardScreen(),
                          ),
                          TitleButton(
                            image: Images.like,
                            title: 'favorite'.tr,
                            navigateTo: const FavoriteScreen(
                              isBackToExit: true,
                            ),
                          ),
                          TitleButton(
                            image: Images.event,
                            title: 'new_and_event'.tr,
                            navigateTo: const EventScreen(),
                          ),
                          TitleButton(
                            image: Images.noteIcon,
                            title: 'history'.tr,
                            navigateTo: const OrderScreen(isBackToExit: true),
                          ),
                          TitleButton(
                            image: Images.cart,
                            title: 'my_cart'.tr,
                            navigateTo: const CartScreen(isBackToExit: true),
                          ),

                          TitleButton(
                            image: Images.info,
                            title: 'about_us'.tr,
                            navigateTo: HtmlViewScreen(
                              title: 'about_us'.tr,
                              url: 'https://google.com',
                            ),
                          ),
                          TitleButton(
                            image: Images.contactUs,
                            title: 'contact_us'.tr,
                            navigateTo: ContactUsScreen(isBackToExit: true),
                          ),

                          ListTile(
                            leading: SizedBox(
                              width: 30,
                              child: Image.asset(
                                Images.loginIcon,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            title: Text(
                              'sign_in'.tr,
                              style: titilliumRegular.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                            onTap: () {
                              Get.to(() => const LoginScreen());

                              // showModalBottomSheet(
                              //   backgroundColor: Colors.transparent,
                              //   context: context,
                              //   builder:
                              //       (_) => const LogoutCustomBottomSheet(),
                              // );
                            },
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 30,
                              child: Image.asset(
                                Images.exitIcon,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            title: Text(
                              'sign_out'.tr,
                              style: titilliumRegular.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) => const LogoutCustomBottomSheet(),
                              );
                            },
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: 25,
                              child: Image.asset(Images.delete),
                            ),
                            title: Text(
                              'delete_my_account'.tr,
                              style: titilliumRegular.copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                            onTap: null,

                            // () => showModalBottomSheet(
                            //   backgroundColor: Colors.transparent,
                            //   context: context,
                            //   builder:
                            //       (_) => DeleteAccountBottomSheet(
                            //         customerId:
                            //             Provider.of<ProfileProvider>(
                            //               context,
                            //               listen: false,
                            //             ).userID,
                            //       ),
                            // ),
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
      ),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  final bool isHomePage;
  final bool isProfile;
  final bool isStoreRegister;

  const TitleButton({
    super.key,
    required this.image,
    required this.title,
    required this.navigateTo,
    this.isHomePage = false,
    this.isProfile = false,
    this.isStoreRegister = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Theme.of(context).hintColor,
          ),
        ],
      ),
      leading: Image.asset(
        image,
        width: 25,
        height: 25,
        fit: BoxFit.fill,
        color: Theme.of(context).secondaryHeaderColor,
      ),
      title: Text(
        title!,
        style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
      ),
      onTap: () {
        if (isHomePage) {
          Get.offAll(() => navigateTo);
        } else {
          Get.to(() => navigateTo);
        }
      },
    );
  }
}
