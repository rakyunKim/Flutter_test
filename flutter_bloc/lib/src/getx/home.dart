import 'package:flutter/material.dart';
import 'package:flutter_bloc_widget/src/getx/count_getx_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetxHome extends GetView<CountGetxController> {
  const GetxHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Getx 상태관리')),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.value.toString(),
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: controller.addCount,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: controller.substractCount,
            backgroundColor: Colors.red,
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}
