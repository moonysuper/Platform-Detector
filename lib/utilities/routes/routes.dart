import 'package:get/get.dart';

import '../../view/main_screen/main_screen.dart';
import '../app_binding/app_binding.dart';



List<GetPage> routes = [
  GetPage(name: '/', page: ()=>  MainScreen(),binding:AppBinding(),),

];