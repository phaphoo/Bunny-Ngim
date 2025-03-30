import 'package:bunny_ngim_app/model/response/new_event_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final NewEventModel newEventModel;
  const EventWidget({super.key, required this.newEventModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
            child: CustomImage(
              image:
                  newEventModel.imginfo != null
                      ? newEventModel.imginfo!.filepath
                      : '',
              width: MediaQuery.of(context).size.width / 1.8,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width:
                    double.infinity, // Ensures full width of parent Container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radiusSizeDefault),
                    bottomRight: Radius.circular(Dimensions.radiusSizeDefault),
                  ),
                  color: Colors.black38,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    Dimensions.paddingSizeExtraSmall,
                  ),
                  child: Text(
                    newEventModel.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: titilliumRegular.copyWith(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
