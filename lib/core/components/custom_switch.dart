import 'package:flutter/material.dart';

enum _Type { normal, text }

abstract class CustomSwitch extends StatefulWidget {
  final bool? initialState;
  final String? text;
  final TextStyle? textStyle;
  final Function(bool) onChanged;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Icon? onIcon;
  final Icon? offIcon;
  final _Type type;

  const CustomSwitch({
    super.key,
    this.initialState,
    this.text,
    this.textStyle,
    required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.focusColor,
    this.hoverColor,
    this.onIcon,
    this.offIcon,
    required this.type,
  });

  const factory CustomSwitch.text({
    bool? initialState,
    required String text,
    TextStyle? textStyle,
    required Function(bool) onChanged,
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    Color? focusColor,
    Color? hoverColor,
    Icon? onIcon,
    Icon? offIcon,
  }) = _Text;

  const factory CustomSwitch.normal({
    bool? initialState,
    required Function(bool) onChanged,
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    Color? focusColor,
    Color? hoverColor,
    Icon? onIcon,
    Icon? offIcon,
  }) = _Normal;
}

class _Text extends CustomSwitch {
  const _Text({
    super.initialState,
    required super.text,
    super.textStyle,
    required super.onChanged,
    super.activeColor,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.focusColor,
    super.hoverColor,
    super.onIcon,
    super.offIcon,
  }) : super(type: _Type.text);

  @override
  State<_Text> createState() => _TextState();
}

class _TextState extends State<_Text> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialState ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text!, style: widget.textStyle),
        Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
              widget.onChanged(value);
            });
          },
          activeColor: widget.activeColor,
          activeTrackColor: widget.activeTrackColor,
          inactiveThumbColor: widget.inactiveThumbColor,
          inactiveTrackColor: widget.inactiveTrackColor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          thumbIcon:
              isOn
                  ? WidgetStatePropertyAll(widget.onIcon)
                  : WidgetStatePropertyAll(widget.offIcon),
        ),
      ],
    );
  }
}

class _Normal extends CustomSwitch {
  const _Normal({
    super.initialState,
    required super.onChanged,
    super.activeColor,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.focusColor,
    super.hoverColor,
    super.onIcon,
    super.offIcon,
  }) : super(type: _Type.normal);

  @override
  State<_Normal> createState() => _NormalState();
}

class _NormalState extends State<_Normal> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialState ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOn,
      onChanged: (value) {
        setState(() {
          isOn = value;
          widget.onChanged(value);
        });
      },
      activeColor: widget.activeColor,
      activeTrackColor: widget.activeTrackColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveTrackColor: widget.inactiveTrackColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      thumbIcon:
          isOn
              ? WidgetStatePropertyAll(widget.onIcon)
              : WidgetStatePropertyAll(widget.offIcon),
    );
  }
}
