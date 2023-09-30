import 'package:get/get.dart';
class Count extends GetxController{
 int count1 = 0;
 int count2 = 1;
 int sum = 0;
 void icrement(){
  count1++;
  count2++;
  update();
 }

void result(int count1,int count2){
  sum = count1 + count2;
  update();
}
}