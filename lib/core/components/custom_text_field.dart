import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';

class CustomTextField extends HookWidget {
  final GlobalKey<FormFieldState>? formFieldKey;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;

  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final bool obscureText;
  final int maxLines;
  final int? minLines;
  final bool enabled;
  final bool readOnly;
  final Color? fillColor;
  final double? height;
  final double? width;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final Icon? icon;
  final Color? iconColor;

  const CustomTextField({
    super.key,
    this.formFieldKey,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.controller,
    this.textInputAction,
    this.validator,
    this.autovalidateMode,
    this.textInputType,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.helperText,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.readOnly = false,
    this.fillColor,
    this.height,
    this.width,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    useListenable(focusNode);

    return SizedBox(
      height: height,
      width: width ?? context.screenWidth / 4.8,
      child: TextFormField(
        key: formFieldKey,
        initialValue: initialValue,
        style: style ?? context.displayLarge,
        inputFormatters: inputFormatters,
        autovalidateMode: autovalidateMode,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        textInputAction: textInputAction ?? TextInputAction.next,
        validator: validator,
        keyboardType: textInputType,
        maxLines: maxLines,
        minLines: minLines,
        enabled: enabled,
        readOnly: readOnly,
        textAlign: textAlign,
        decoration: InputDecoration(
          icon: icon,
          iconColor: iconColor,
          enabled: enabled,
          contentPadding: contentPadding,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: focusNode.hasFocus ? labelStyle : labelStyle,
          helperText: helperText,
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          hoverColor: Colors.transparent,
        ),
      ),
    );
  }
}
