import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/size_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';

class FailureDisplay extends StatelessWidget {
  final String error;
  final TextStyle? textStyle;
  final void Function()? refresh;

  const FailureDisplay({
    super.key,
    required this.error,
    this.textStyle,
    this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConstants.inputFieldHorizontalPadding,
      ),
      child: Center(
        child: Column(
          children: [
            Text(error, style: textStyle ?? context.displaySmall),
            refresh == null
                ? SizedBox()
                : IconButton(
                    onPressed: refresh,
                    icon: Icon(Icons.refresh, size: 42),
                  ),
          ],
        ),
      ),
    );
  }
}
