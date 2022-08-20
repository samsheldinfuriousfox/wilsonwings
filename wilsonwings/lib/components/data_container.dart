import 'package:flutter/material.dart';
import 'package:wilsonwings/utils/colors.dart';

class DataContainer extends StatelessWidget {
  final Widget child;
  final double? paddingValue, height, width, marginValue;
  const DataContainer(this.child,
      {this.paddingValue, this.height, this.width, this.marginValue, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(paddingValue ?? 20),
      margin: EdgeInsets.all(paddingValue ?? 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Appcolors.grey, Colors.white],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 10),
              blurRadius: 40.0,
              color: Appcolors.shadow.withOpacity(0.60),
            ),
            const BoxShadow(
              offset: Offset(-10, -10),
              blurRadius: 20.0,
              color: Colors.white,
            ),
          ]),
      child: child,
    );
  }
}
