import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar(
      {super.key, required this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.primary100,
      centerTitle: true,
      title: Text(
        title!,
        style: textTheme.headlineSmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
