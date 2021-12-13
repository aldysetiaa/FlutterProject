import 'package:get/get.dart';
import 'Screens/HomePage.dart';
import 'package:jubelio_pos/Screens/Splashscreen.dart';

class Rute{
  static final route = [
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
    ),
    GetPage(
        name: '/',
        page: () => HomePage()
    ),

  ];
}