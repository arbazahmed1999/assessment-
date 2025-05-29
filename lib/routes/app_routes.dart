// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../view/screens/screen1_view.dart';
import '../view/screens/screen5_view.dart';
import '../view/screens/screen3_view.dart';

class AppRoutes {
  static const screen1 = '/screen1';
  static const screen3 = '/screen3';
  static const screen5 = '/screen5';

  static final routes = [
    GetPage(name: screen1, page: () => Screen1View()),
    GetPage(name: screen3, page: () => Screen3View()),
    GetPage(name: screen5, page: () => Screen5View()),
  ];
}
