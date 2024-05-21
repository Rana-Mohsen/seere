import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seere/views/intro_screen.dart';
import 'package:seere/views/nav_container.dart';

import '../utils/login_helpper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: Center(
        child: SvgPicture.asset(
          'assets/images/splash.svg',
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: Helper.isLogged == true
                    ? const NavContainer()
                    : const onBoarding(),
      duration: const Duration(milliseconds: 5000),
    );
  }
}
