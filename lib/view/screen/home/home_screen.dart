import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/screen/category/widgets/category_list_widget.dart';
import 'package:bunny_ngim_app/view/screen/home/widgets/banners_widget.dart';
import 'package:bunny_ngim_app/view/screen/search/search_home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Get.find<CategoryController>().getCategoryList();
            // await HomePage.loadData(true);
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).highlightColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(Images.logo, height: 45),
                        const SizedBox(width: Dimensions.paddingSizeSmall),
                        Text(AppConstants.NAME),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Image.asset(
                          Images.shoppingCart,
                          color: Theme.of(context).primaryColor,

                          width: Dimensions.iconSizeExtraLarge,
                          height: Dimensions.iconSizeExtraLarge,
                        ),

                        Positioned.fill(
                          child: Container(
                            transform: Matrix4.translationValues(5, -3, 0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                radius: ResponsiveHelper.isTab() ? 10 : 7,
                                backgroundColor: ColorResources.logout,
                                child: Text(
                                  '0',
                                  style: titilliumSemiBold.copyWith(
                                    color: ColorResources.white,
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                  ),
                                ),
                              ),
                            ),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => const SearchScreen()),
                      // );
                    },
                    child: Hero(
                      tag: 'search',

                      child: Material(
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    const CategoryListWidget(isHomePage: true),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
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
