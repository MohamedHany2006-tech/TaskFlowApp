
import 'package:flutter/material.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/style/ColorManager.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? isPassword;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  TextInputField({
    super.key,
    required this.title,
    this.hintText,
    this.hintStyle,
    this.fillColor,
    this.isPassword,
    this.obscureText,
    this.validator,
    this.controller,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText =
        widget.obscureText ?? widget.isPassword == true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style:
              TextStyleManager.textStyleNeutralPrimarySB16(context),
        ),

        SizedBox(
          height: Units.getHeight(
            context: context,
            value: 12,
          ),
        ),

        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          cursorColor: ColorManager.BrandPrimaryDefault,
          validator: widget.validator,

          decoration: InputDecoration(
            hintText: widget.hintText ?? '',
            hintStyle:
                widget.hintStyle ??
                TextStyleManager.textStyleNeutralGhostR16(
                  context,
                ),

            filled: true,

            fillColor:
                widget.fillColor ??
                ColorManager.NeutralBackground,

            contentPadding: EdgeInsets.symmetric(
              horizontal: Units.getWidth(
                context: context,
                value: 20,
              ),
              vertical: Units.getHeight(
                context: context,
                value: 16,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorManager.NeutralLine,
                width: 1,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: ColorManager.BrandPrimaryDefault,
                width: 1.5,
              ),
            ),

            suffixIcon: passwordForm(),
          ),
        ),
      ],
    );
  }

  Widget passwordForm() {
    if (widget.isPassword == true) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: ColorManager.NeutralGhost,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return const SizedBox.shrink();
  }
}
