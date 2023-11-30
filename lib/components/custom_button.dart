import 'package:flutter/material.dart';
import 'package:truth_or_truth/utils/const.dart';
import 'package:truth_or_truth/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressed;
  final ButtonType buttonType;
  final Icon? btnIcon;

  const CustomButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.buttonType = ButtonType.primary,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (buttonType) {
      case ButtonType.primary:
        backgroundColor = AppColor.primary;
        textColor = AppColor.mainColor;
        break;
      case ButtonType.secondary:
        backgroundColor = AppColor.secondary;
        textColor = AppColor.mainColor;
        break;
      case ButtonType.tersier:
        backgroundColor = AppColor.tersier;
        textColor = AppColor.primary;
        break;
      case ButtonType.optional:
        backgroundColor = AppColor.mainColor;
        textColor = AppColor.tersier;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.s5, horizontal: Sizes.s25),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (btnIcon != null) btnIcon!,
          SizedBox(width: btnIcon != null ? Sizes.s15 : 0),
          Text(buttonLabel.toUpperCase()),
        ],
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
  tersier,
  optional,
}
