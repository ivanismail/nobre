import 'package:flutter/services.dart';

import '../export.dart';

class XTextField extends StatelessWidget {
  final Widget? suffixIcon, prefixIcon;
  final Color? backgroudColor, textHintColor, textLabelColor;
  final EdgeInsets? padding, margin;
  final String? hintText, labelText, errorText;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final bool readOnly, obscureText;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final int? maxline, minline;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final double? spacing;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const XTextField(
      {Key? key,
      this.suffixIcon,
      this.backgroudColor,
      this.textHintColor,
      this.padding,
      this.hintText,
      this.labelText,
      this.textLabelColor,
      this.margin,
      this.focusNode,
      this.onChange,
      this.readOnly = false,
      this.onTap,
      this.keyboardType,
      this.obscureText = false,
      this.maxline,
      this.minline,
      this.controller,
      this.labelStyle,
      this.prefixIcon,
      this.textStyle,
      this.spacing,
      this.errorText,
      this.maxLength,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.labelText != null
            ? Text(
                this.labelText.toString(),
                style: this.labelStyle ??
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: h4,
                    ),
              )
            : displayNone(),
        SizedBox(height: this.spacing ?? 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: XTheme.borderRadius(),
            color: this.backgroudColor,
          ),
          child: TextField(
            controller: this.controller,
            maxLines: this.maxline ?? 1,
            minLines: this.minline ?? 1,
            keyboardType: this.keyboardType,
            readOnly: this.readOnly,
            onTap: this.onTap,
            style: this.textStyle ?? TextStyle(fontSize: h5),
            decoration: InputDecoration(
              errorText: this.errorText ?? null,
              errorStyle: h4n,
              enabledBorder: OutlineInputBorder(
                borderRadius: XTheme.borderRadius(),
                borderSide: BorderSide(color: XColor.netral3()),
              ),
              border: OutlineInputBorder(
                borderRadius: XTheme.borderRadius(),
              ),
              contentPadding: this.padding ??
                  EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 8, bottom: 8),
              hintText: this.hintText,
              hintStyle: TextStyle(color: XColor.netral5()),
              suffixIcon: this.suffixIcon,
              prefixIcon: this.prefixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: XColor.primary(), width: 1.0),
                borderRadius: XTheme.borderRadius(),
              ),
              counter: Offstage(),
            ),
            cursorColor: Colors.grey,
            obscureText: this.obscureText,
            maxLength: this.maxLength,
            inputFormatters: this.inputFormatters,
          ),
        ),
        Spacing(height: this.spacing ?? 8),
      ],
    );
  }
}

class SuffixIconTextOutline extends StatelessWidget {
  final String url;
  final VoidCallback? onTap;
  const SuffixIconTextOutline(
    this.url, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Transform.scale(
        scale: .5,
        child: SvgPicture.asset(url),
      ),
    );
  }
}
