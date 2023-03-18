import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uhr/app_router.gr.dart';

class ClockAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ClockAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<ClockAppBar> createState() => _ClockAppBarState();
}

class _ClockAppBarState extends State<ClockAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      foregroundColor: Theme.of(context).textTheme.headline1?.color,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {context.pushRoute(const SettingsPage());},
      ),
      elevation: 0.8,
    );
  }
}
