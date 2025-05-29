import 'package:get/get.dart';
import '../view/screens/screen1_view.dart';
import '../view/screens/screen3_view.dart';
import '../view/screens/screen5_view.dart';
import '../view/screens/screen6_view.dart';
import '../view/screens/screen7_view.dart';
import '../bindings/screen_bindings.dart';

class AppRoutes {
  static const screen1 = '/screen1';
  static const screen3 = '/screen3';
  static const screen4 = '/screen4';
  static const screen5 = '/screen5';
  static const screen6 = '/screen6';
  static const screen7 = '/screen7';

  static final routes = [
    GetPage(
      name: screen1,
      page: () => Screen1View(),
      binding: ScreenBindings(),
    ),
    GetPage(
      name: screen3,
      page: () => Screen3View(),
      binding: ScreenBindings(),
    ),

    GetPage(
      name: screen5,
      page: () => Screen5View(),
      binding: ScreenBindings(),
    ),
    GetPage(
      name: screen6,
      page: () => Screen6View(),
      binding: ScreenBindings(),
    ),
    GetPage(
      name: screen7,
      page: () => Screen7View(),
      binding: ScreenBindings(),
    ),
  ];
}
