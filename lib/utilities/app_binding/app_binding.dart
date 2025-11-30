import 'package:get/get.dart';

import '../../controller/main_controller/main_controller.dart';



class AppBinding implements Bindings {
  @override
  void dependencies() {

    Get.put(MainController());


  }

}