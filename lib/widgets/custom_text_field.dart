import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final bool autoFocus;
  final String? hint;
  final String? initial;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final Color? border;
  final bool readOnly;
  final bool obscure;
  final Function()? onTap;
  final Function(String)? onSubmit;

  const CustomTextField({
    Key? key,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onValueChange,
    this.controller,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.name,
    this.border,
    this.readOnly = false,
    this.onTap,
    this.initial,
    this.obscure = false,
    this.onSubmit,
    this.autoFocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    const textTheme = TextStyle(
      fontFamily: "ZillaSlab",
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
    return TextFormField(
      autofocus: autoFocus,
      onFieldSubmitted: onSubmit,
      obscureText: obscure,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: readOnly,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      maxLines: 1,
      initialValue: initial,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      decoration: InputDecoration(
          prefixIcon: (prefixIcon != null) ? prefixIcon : null,
          suffixIcon: (suffixIcon != null) ? suffixIcon : null,
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 89, 89, 89),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xff00183F),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 255, 41, 8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xff00183F),
            ),
          ),
          hintText: hint ?? "",
          hintStyle: TextStyle(color: Color.fromARGB(255, 202, 202, 202))),
      style: textTheme,
    );
  }
}
