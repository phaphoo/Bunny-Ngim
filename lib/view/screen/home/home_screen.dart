import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_screen.dart';
import 'package:bunny_ngim_app/view/screen/category/widgets/category_list_widget.dart';
import 'package:bunny_ngim_app/view/screen/home/widgets/banners_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/featured_deal_list_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/products_view.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_list_widget.dart';
import 'package:bunny_ngim_app/view/screen/search/search_home_page_widget.dart';
import 'package:bunny_ngim_app/view/screen/search/search_screen.dart';
import 'package:bunny_ngim_app/view/setting/popup_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  Future<void> load() async {
    await Get.find<CategoryController>().getCategoryList();
    await Get.find<ProductController>().getAllProductList();
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<CartController>(
        builder: (cartController) {
          return SafeArea(
            child: GetBuilder<LocalizationController>(
              builder: (locale) {
                return RefreshIndicator(
                  onRefresh: () async {
                    load();
                  },
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        floating: false,
                        elevation: 0,
                        centerTitle: false,
                        automaticallyImplyLeading: false,
                        backgroundColor: Theme.of(context).cardColor,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(Images.logo, height: 45),
                                const SizedBox(
                                  width: Dimensions.paddingSizeSmall,
                                ),
                                Text(AppConstants.NAME),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap:
                                      () => showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (_) => const PopupLanguage(),
                                      ),
                                  child:
                                      locale.locale.countryCode == "KH"
                                          ? CustomImage(
                                            image: Images.khmer,
                                            height:
                                                Dimensions.iconSizeExtraLarge -
                                                3,
                                            width:
                                                Dimensions.iconSizeOverLarge -
                                                20,
                                          )
                                          : CustomImage(
                                            image: Images.english,
                                            height:
                                                Dimensions.iconSizeExtraLarge -
                                                3,
                                            width:
                                                Dimensions.iconSizeOverLarge -
                                                20,
                                          ),
                                ),
                                const SizedBox(
                                  width: Dimensions.paddingSizeSmall,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => CartScreen(isBackToExit: true),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        Images.cart,
                                        color: Theme.of(context).primaryColor,

                                        width: Dimensions.iconSizeExtraLarge,
                                        height: Dimensions.iconSizeExtraLarge,
                                      ),

                                      Positioned.fill(
                                        child: Container(
                                          transform: Matrix4.translationValues(
                                            5,
                                            -3,
                                            0,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              radius:
                                                  ResponsiveHelper.isTab()
                                                      ? 10
                                                      : 7,
                                              backgroundColor:
                                                  ColorResources.logout,
                                              child: Text(
                                                cartController
                                                        .cartItems
                                                        .isNotEmpty
                                                    ? '${cartController.cartItems.length}'
                                                    : '0',
                                                style: titilliumSemiBold.copyWith(
                                                  color: ColorResources.white,
                                                  fontSize:
                                                      Dimensions
                                                          .fontSizeExtraSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverDelegate(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => SearchScreen());
                            },
                            child: Hero(
                              tag: 'search_item',

                              child: Material(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: SearchHomePageWidget(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BannersWidget(),
                            const CategoryListWidget(isHomePage: true),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeSmall,
                              ),
                              child: TitleWidget(
                                title: 'featured'.tr,
                                onTap: null,
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.paddingSizeDefault,
                            ),
                            const FeaturedDealsListWidget(),
                            // const SizedBox(
                            //   height: Dimensions.paddingSizeDefault,
                            // ),
                            const ProductListWidget(isHomePage: true),
                            // const SizedBox(
                            //   height: Dimensions.paddingSizeDefault,
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeSmall,
                              ),
                              child: TitleWidget(
                                title: 'all_product'.tr,
                                onTap: null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                Dimensions.paddingSizeSmall,
                              ),
                              child: ProductView(
                                isHomePage: false,
                                scrollController: _scrollController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  double height;
  SliverDelegate({required this.child, this.height = 70});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != height ||
        oldDelegate.minExtent != height ||
        child != oldDelegate.child;
  }
}
