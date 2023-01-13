import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:infobash_view/constants/constraints.dart';
import 'package:infobash_view/screens/matches.dart';
import 'package:infobash_view/screens/more_screen.dart';
import 'package:infobash_view/screens/score_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  static const routName = 'bottom-nav-screen';

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final screens = [
    const ScoreScreen(),
    const MatchesScreen(),
    const MoreScreen()
  ];
  final items = const [
    Icon(
      Icons.home_outlined,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.sports_baseball_outlined,
      size: 30,
      color: Colors.black,
    ),
    Icon(
      Icons.more_vert_outlined,
      size: 30,
      color: Colors.black,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            color: kPrimaryColorlight,
            backgroundColor: Colors.transparent,
            index: index,
            height: 60,
            items: items,
            onTap: (index) {
              setState(() => this.index = index);
            },
          ),
        ),
      ),
    );
  }
}
