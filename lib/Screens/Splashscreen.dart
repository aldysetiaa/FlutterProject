import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key?  key}) : super (key: key);
  @override
  Widget build(BuildContext context) {

    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png'),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const HomePage(),
      durationInSeconds: 3,
    );
  }
}