import 'package:bunny_ngim_app/model/response/new_event_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAndEventDetailScreen extends StatelessWidget {
  final NewEventModel event;

  const NewAndEventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: event.title!),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
              child: CustomImage(
                image: event.imginfo != null ? event.imginfo!.filepath : '',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Text(
              event.title!,
              style: titilliumBold.copyWith(
                fontSize: Dimensions.fontSizeExtraLarge,
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            Text(
              "${'start'.tr}: ${event.postDate}  |  ${'end'.tr}: ${event.expiredDate}",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            Text(
              event.translate!['description'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
