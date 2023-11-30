import 'package:flutter/material.dart';
import 'package:truth_or_truth/utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  static bool centerTitle = true;

  const CustomAppBar({
    super.key,
    required this.pageTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isHomePage = pageTitle == "Home";

    return AppBar(
      title: Text(
        pageTitle,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColor.mainColor),
      ),
      automaticallyImplyLeading: checkImplyLeading(),
      backgroundColor: AppColor.secondary,
      centerTitle: true,
      actions: _buildActions(isHomePage),
    );
  }

  bool checkImplyLeading() {
    return pageTitle == 'New Question';
  }

  List<Widget> _buildActions(bool isHomePage) {
    List<Widget> actions = [];

    if (isHomePage) {
      actions.add(
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: AppColor.tersier,
          ),
          onPressed: () {},
        ),
      );
    }
    return actions;
  }
}
