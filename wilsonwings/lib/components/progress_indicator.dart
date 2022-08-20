import 'package:flutter/material.dart';
import 'package:wilsonwings/utils/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double value;
  final Color? colorValue, backgroundColor;
  const CustomProgressIndicator(this.value,
      {this.colorValue, this.backgroundColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: backgroundColor ?? Appcolors.lightPurpule,
        minHeight: 6,
        valueColor: AlwaysStoppedAnimation<Color>(colorValue ?? Appcolors.red),
      ),
    );
  }
}
