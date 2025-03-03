import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlViewScreen extends StatelessWidget {
  final String? title;
  final String? url;
  const HtmlViewScreen({super.key, required this.url, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title!),
      // backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          // CustomAppBar(title: title),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              physics: const BouncingScrollPhysics(),
              child: Html(
                style: {'html': Style(textAlign: TextAlign.justify)},
                data: url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
