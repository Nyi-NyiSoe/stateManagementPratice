import 'package:get/get.dart';

class Count extends GetxController {
  static Count get to => Get.find(); //to use outside GetBuilder
  //without static => Get.find<Count>().method();

  int count1 = 0;
  int count2 = 1;
  RxInt sum = 0.obs;
  void icrement() {
    count1++;
    count2++;
    update();
  }

  void result(int count1, int count2) {
    sum.value = count1 + count2;
    update();
  }
}
