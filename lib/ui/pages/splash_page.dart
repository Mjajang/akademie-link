import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/pages/on_boarding_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/splash.webp',
      ),
      logoWidth: 200,
      title: Text(
        "Akademie|Link",
        style: splashText.copyWith(
          fontWeight: bold,
          fontSize: 30,
        ),
      ),
      showLoader: false,
      durationInSeconds: 5,
      navigator: const OnBoardingPage(),
    );
  }
}
