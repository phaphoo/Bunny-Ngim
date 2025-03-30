import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/screen/home/event/news_and_event_detail_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/event/widget/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'all_news_and_envent'.tr),
      body: GetBuilder<ConfigController>(
        builder: (configController) {
          return configController.isLoading!
              ? Center(child: CircularProgressIndicator())
              : configController.newEvent != null &&
                  configController.newEvent!.isNotEmpty
              ? MasonryGridView.count(
                itemCount: configController.newEvent!.length,
                crossAxisCount: 2,
                padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => NewAndEventDetailScreen(
                          event: configController.newEvent![index],
                        ),
                      );
                    },
                    child: EventWidget(
                      newEventModel: configController.newEvent![index],
                    ),
                  );
                },
              )
              : NoInternetOrDataScreenWidget(isNoInternet: false);
        },
      ),
    );
  }
}
