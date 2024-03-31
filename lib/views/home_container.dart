import 'package:flutter/material.dart';
import 'package:seere/views/app_center_view.dart';
import 'package:seere/views/home_view.dart';
import 'package:seere/views/my_info_view.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key,});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int currentIndex = 0;
  List<Widget> pages = [const HomeView(), const AppCenterView(), const MyInfoView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Application Center"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "My Info"),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}