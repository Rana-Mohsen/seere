import 'package:flutter/material.dart';
import 'package:seere/views/app_center_view.dart';
import 'package:seere/views/home_view.dart';
import 'package:seere/views/my_info_view.dart';

class NavContainer extends StatefulWidget {
  const NavContainer({
    super.key,
  });
  @override
  State<NavContainer> createState() => _NavContainerState();
}

class _NavContainerState extends State<NavContainer> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const AppCenterView(),
    const MyInfoView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/home.png")),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/app_center.png")),
              label: "Application Center"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/my_info.png")),
              label: "My Info"),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
