import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';

class ShelfItem extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isSelected;
  final void Function() onPressed;
  final Widget child;

  const ShelfItem({
    super.key,
    this.height,
    this.width,
    required this.isSelected,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          height: height,
          width: width,
          child: Material(
            color: isSelected
                ? ColorConstants.lightBoxColor
                : ColorConstants.shelfItemNotSelectedColor,
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(alignment: Alignment.centerLeft, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
