import 'package:flutter/material.dart';

import '../../app_base/config/app_config.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.height});
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.5,
      decoration: BoxDecoration(
        color: color ?? AppColors.neutral01,
        border: Border.all(
            color: color ?? AppColors.neutral01, width: AppSize.borderWidth),
      ),
    );
  }
}
