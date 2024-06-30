import 'package:get/get.dart';

class HomepageState extends GetxController {
  static HomepageState get instance => Get.find();

  final List<String> cities = [
    'กรุงเทพ',
    'เชียงใหม่',
    'เชียงราย',
    'ภูเก็ต',
  ];

  var selectedCity = ''.obs;
}
