import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'router.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Jubelio POS',
      debugShowCheckedModeBanner: false,
      getPages: Rute.route,
      initialRoute: '/splash',
    ),
  );
}