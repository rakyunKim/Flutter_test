import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CountGetxController extends GetxController{
  RxInt count = 0.obs;

  void addCount(){
    count(count.value + 1);
  }

  void substractCount(){
    count(count.value - 1);
  }

}
