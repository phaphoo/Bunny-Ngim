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
            ? Text(
              "${widget.title}",
              style: widget.textStyle ?? titilliumBold.copyWith(),
              textScaleFactor: 1,
            )
            : SizedBox(),
        widget.title != null ? SizedBox(height: 0) : SizedBox(),
        Container(
          decoration:
              widget.decoration ??
              BoxDecoration(
                border: Border.all(color: ColorResources.black),
                borderRadius: BorderRadius.circular(
                  Dimensions.paddingSizeDefault,
                ),
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
            child: TextFormField(
              // readOnly: widget.isTap || widget.isReadOnly  ? true : false,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                hintText: widget.hinttext,
                hintStyle: titilliumBold,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
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
