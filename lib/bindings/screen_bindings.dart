import 'package:get/get.dart';
import '../controllers/screen1_controller.dart';
import '../controllers/screen2_controller.dart';
import '../controllers/screen3_controller.dart';
import '../controllers/screen4_controller.dart';
import '../controllers/screen5_controller.dart';
import '../controllers/screen6_controller.dart';
import '../controllers/screen7_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Screen1Controller>(() => Screen1Controller());
    Get.lazyPut<Screen2Controller>(() => Screen2Controller());
    Get.lazyPut<Screen3Controller>(() => Screen3Controller());
    Get.lazyPut<Screen4Controller>(() => Screen4Controller());
    Get.lazyPut<Screen5Controller>(() => Screen5Controller());
    Get.lazyPut<Screen6Controller>(() => Screen6Controller());
    Get.lazyPut<Screen7Controller>(() => Screen7Controller());
  }
}
