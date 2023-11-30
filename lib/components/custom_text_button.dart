import 'package:flutter/material.dart';
import 'package:truth_or_truth/utils/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressed;
  final TextButtonType textButtonType;
  final Icon? btnIcon;

  const CustomTextButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.textButtonType = TextButtonType.primary,
    this.btnIcon,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;

    switch (textButtonType) {
      case TextButtonType.primary:
        textColor = AppColor.primary;
        break;
      case TextButtonType.secondary:
        textColor = AppColor.secondary;
        break;
      case TextButtonType.tersier:
        textColor = AppColor.tersier;
        break;
      case TextButtonType.optional:
        textColor = AppColor.mainColor;
        break;
    }

    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonLabel.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: textColor),
      ),
    );
  }
}

enum TextButtonType {
  primary,
  secondary,
  tersier,
  optional,
}
