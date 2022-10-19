import 'package:flutter/material.dart';

class ClockAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ClockAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<ClockAppBar> createState() => _ClockAppBarState();
}

class _ClockAppBarState extends State<ClockAppBar> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.alarm),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/alarm_clock');
              },
            ),
            IconButton(
              icon: const Icon(Icons.timer_sharp),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/stopwatch');
              } ,
            ),
            IconButton(
              icon: const Icon(Icons.hourglass_empty),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/timer');
              },
            ),
          ],
      )
    );
  }
}
