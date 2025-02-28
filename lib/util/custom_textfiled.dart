import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hinttext;
  final TextEditingController? controller;
  final IconData? iconData;
  final TextInputType? textInputType;
  final Function? onTap;
  final TextStyle? textStyle;
  final isEnter;
  final isTap;
  void Function()? onTapKey;
  final isReadOnly;
  final IconData? surfixIcon;
  final BoxDecoration? decoration;
  CustomTextField({
    super.key,
    this.title,
    this.decoration,
    this.hinttext,
    this.controller,
    this.iconData,
    this.textInputType,
    this.onTap,
    this.isEnter = false,
    this.isTap = false,
    this.onTapKey,
    this.isReadOnly = false,
    this.surfixIcon,
    this.textStyle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.title != null
            ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "${widget.title}",
                style:
                    widget.textStyle ??
                    titleHeader.copyWith(color: ColorResources.white),
                textScaleFactor: 1,
              ),
            )
            : const SizedBox(),
        widget.title != null ? const SizedBox(height: 0) : const SizedBox(),
        Container(
          decoration:
              widget.decoration ??
              BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.paddingSizeSmall,
                ),
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              Dimensions.paddingSizeExtraSmall,
            ),
            child: TextFormField(
              readOnly: widget.isTap || widget.isReadOnly ? true : false,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSizeSmall),
                  ),
                  borderSide: BorderSide(color: Theme.of(context).hintColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSizeSmall),
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                hintText: widget.hinttext,
                hintStyle: titilliumRegular.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                border: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.symmetric(
                  vertical:
                      ResponsiveHelper.isTab()
                          ? Dimensions.paddingSizeLarge
                          : Dimensions.paddingSizeSmaller,
                  horizontal:
                      ResponsiveHelper.isTab()
                          ? Dimensions.paddingSizeExtraLarge
                          : Dimensions.paddingSizeLarge,
                ),
                fillColor: Colors.transparent,
                suffixIcon:
                    widget.surfixIcon != null
                        ? Icon(widget.surfixIcon, size: 18)
                        : null,
              ),
              maxLines: widget.isEnter ? 2 : 1,
              onTap: widget.onTapKey,
            ),
          ),
        ),
      ],
    );
  }
}
