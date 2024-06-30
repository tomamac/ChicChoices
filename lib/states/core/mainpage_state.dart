import 'package:get/get.dart';

class MainPageState extends GetxController {
  var currentIndex = 0.obs;

  void setPage(int page) {
    currentIndex.value = page;
  }
}
