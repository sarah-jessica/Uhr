import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ClockAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ClockAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<ClockAppBar> createState() => _ClockAppBarState();
}

class _ClockAppBarState extends State<ClockAppBar> {

  String currentRoute = '/alarm_clock';


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
          //mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {
                setState(() => currentRoute = '/alarm_clock');
                Navigator.pushReplacementNamed(context, '/alarm_clock');
              },
            ),
            IconButton(
              icon: Icon(Icons.timer_sharp),
              onPressed: () {
                setState(() => currentRoute = '/stopwatch');
                Navigator.pushReplacementNamed(context, '/stopwatch');
              } ,
            ),
            IconButton(
              icon: Icon(Icons.hourglass_empty),
              onPressed: () {
                setState(() => currentRoute = '/timer');
                Navigator.pushReplacementNamed(context, '/timer');
              },
            ),
          ],
      )
    );
  }
}
