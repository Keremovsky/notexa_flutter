import 'package:flutter/material.dart';

final class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Widget child;
  final bool isGreen;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final WidgetStatesController? statesController;
  final ButtonStyle? style;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.height,
    this.width,
    required this.child,
    this.isGreen = false,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.statesController,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        style: style,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        statesController: statesController,
        child: child,
      ),
    );
  }
}
