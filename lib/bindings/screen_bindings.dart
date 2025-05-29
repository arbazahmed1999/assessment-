import 'package:get/get.dart';
import '../controllers/screen1_controller.dart';
import '../controllers/screen7_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Screen1Controller>(() => Screen1Controller());
    Get.lazyPut<Screen7Controller>(() => Screen7Controller());
  }
}
