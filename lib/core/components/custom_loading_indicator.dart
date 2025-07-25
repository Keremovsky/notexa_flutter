import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final EdgeInsets? padding;
  final double? strokeWidth;
  final StrokeCap? strokeCap;

  const CustomLoadingIndicator({
    super.key,
    this.height = 50,
    this.width = 50,
    this.color,
    this.backgroundColor,
    this.valueColor,
    this.padding,
    this.strokeWidth,
    this.strokeCap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
            color: color,
            backgroundColor: backgroundColor,
            valueColor: valueColor,
            strokeWidth: strokeWidth,
            strokeCap: strokeCap,
          ),
        ),
      ),
    );
  }
}
