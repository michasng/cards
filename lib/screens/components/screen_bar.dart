import 'package:auto_route/auto_route.dart';
import 'package:cards/app_router.gr.dart';
import 'package:flutter/material.dart';

class ScreenBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showHome;
  final Widget? title;
  final List<Widget>? actions;
  @override
  final Size preferredSize;

  ScreenBar({
    Key? key,
    this.showHome = true,
    this.title,
    this.actions,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showHome
          ? IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                AutoRouter.of(context).replace(HomeRoute());
              },
            )
          : null,
      automaticallyImplyLeading: false,
      title: title,
      actions: actions,
    );
  }
}
