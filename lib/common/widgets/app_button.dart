import 'package:flutter/material.dart';

import '../../app_base/config/app_config.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClicked;
  final Color? color;
  final Color? colorBorder;
  final TextStyle? textStyle;
  final ButtonType type;
  final double? height;
  final double? width;
  const AppButton({
    super.key,
    required this.text,
    this.onClicked,
    this.color,
    this.colorBorder,
    this.textStyle,
    this.type = ButtonType.fill,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Widget btn() {
      switch (type) {
        case ButtonType.none:
          return Container(
            width: width ?? double.infinity,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color ?? AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                border: Border.all(
                    color: colorBorder ?? AppColors.white,
                    width: AppSize.borderWidth)),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text16.preSemiBold
                      .copyWith(color: AppColors.neutral01),
            ),
          );

        case ButtonType.disabled:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
                color: color ?? AppColors.borderDisable,
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                border: Border.all(
                    color: colorBorder ?? AppColors.borderDisable,
                    width: AppSize.borderWidth)),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold.copyWith(color: AppColors.white),
            ),
          );
        case ButtonType.fill:
          return Container(
            // width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
              // gradient: const LinearGradient(colors: AppColors.buttonDefault),
              color: AppColors.primary01,
              borderRadius: BorderRadius.circular(AppSize.mediumRadius),
            ),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold.copyWith(color: AppColors.white),
            ),
          );

        case ButtonType.outline:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                  width: AppSize.borderWidth,
                  color: colorBorder ?? AppColors.primary01),
              borderRadius: BorderRadius.circular(AppSize.mediumRadius),
            ),
            child: Text(
              text,
              style: textStyle ??
                  AppStyles.text18.preSemiBold
                      .copyWith(color: AppColors.primary01),
            ),
          );
        case ButtonType.submit:
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: AppSize.spaceBetweenWidgetMedium),
            decoration: ShapeDecoration(
              color: AppColors.kakaoBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.radius6),
              ),
            ),
            child: Text(
              text,
              style: textStyle ?? AppStyles.text15.preMed,
            ),
          );
      }
    }

    return InkWell(
      onTap: () {
        onClicked?.call();
      },
      child: btn(),
    );
  }
}

enum ButtonType { none, disabled, fill, outline, submit }
