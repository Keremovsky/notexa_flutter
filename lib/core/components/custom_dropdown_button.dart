import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDropdownButtonFormField<T> extends HookWidget {
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<T?>? onSaved;
  final FormFieldValidator<T>? validator;
  final T? value;
  final String? labelText;
  final Color? color;
  final String? prefixIconPath;
  final ColorFilter? prefixIconColorFilter;
  final bool iconVisibility;
  final bool isDeselectActive;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final double? height;
  final double? width;

  const CustomDropdownButtonFormField({
    super.key,
    required this.items,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hintText,
    this.labelText,
    this.value,
    this.color,
    this.prefixIconPath,
    this.prefixIconColorFilter,
    this.iconVisibility = true,
    this.isDeselectActive = true,
    this.autovalidateMode,
    this.focusNode,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    useListenable(focusNode);

    return Row(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: IgnorePointer(
            ignoring: onSaved == null,
            child: DropdownButtonFormField2<T>(
              focusNode: focusNode,
              autovalidateMode: autovalidateMode,
              items: items
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e.value,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: e.child,
                      ),
                    ),
                  )
                  .toList(),
              hint: hintText != null
                  ? Text(hintText!, style: context.bodyMedium)
                  : null,
              value: value,
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.zero,
                overlayColor: const WidgetStatePropertyAll<Color>(
                  ColorConstants.lightScaffoldBackground,
                ),
                height: height ?? 60,
                selectedMenuItemBuilder: (context, child) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      color: ColorConstants.lightFilledButton,
                    ),
                    child: DefaultTextStyle(
                      style: context.displayLarge!,
                      child: child,
                    ),
                  );
                },
              ),
              buttonStyleData: const ButtonStyleData(padding: EdgeInsets.zero),
              decoration: InputDecoration(
                enabled: onSaved != null,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                prefixIconConstraints: BoxConstraints.expand(width: 44, height: 50),
                prefixIcon: prefixIconPath != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: const Icon(Icons.arrow_drop_down_rounded),
                      )
                    : null,
                fillColor: ColorConstants.lightBoxColor,
              ),
              style: context.displaySmall,
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                padding: EdgeInsets.zero,
                offset: Offset(0, -4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorConstants.lightBoxColor, width: 1),
                  color: ColorConstants.lightBoxColor,
                  boxShadow: [],
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Visibility(
                  visible: onSaved != null && iconVisibility,
                  child: const Icon(Icons.arrow_drop_down_rounded),
                ),
                openMenuIcon: const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(Icons.arrow_drop_down_rounded),
                ),
                iconEnabledColor: ColorConstants.darkFilledButton,
                iconSize: 28,
              ),
              isExpanded: true,
              onChanged: onChanged,
              onSaved: onSaved,
              validator: validator,
              selectedItemBuilder: (context) => items.map((e) => e.child).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorConstant {}
