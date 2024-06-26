import 'package:fancy_nav/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:seere/views/app_center_view.dart';
import 'package:seere/views/home/home_view.dart';
import 'package:seere/views/my_info_view.dart';
import 'package:animations/animations.dart';
import '../nav_bar_icons.dart';

class NavContainer extends StatefulWidget {
  const NavContainer({
    super.key,
  });
  @override
  State<NavContainer> createState() => _NavContainerState();
}

class _NavContainerState extends State<NavContainer> {
  int currentIndex = 0;
  List<Widget> pages = [const HomeView(), AppCenterView(), const MyInfoView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: MyFlutterApp.home, title: "Home"),
            TabData(iconData: MyFlutterApp.menu, title: "Application Center"),
            TabData(iconData: MyFlutterApp.user, title: "My Info")
          ],
          inactiveIconColor: Colors.black54,
          onTabChangedListener: (index) {
            currentIndex = index;
            setState(() {});
          }),
    );
  }
}
