import 'package:DevAzuma/getx_practice/contollers/tap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            GetBuilder<TapController>(
              builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Center(
                      child: Text(
                        'Tap ${controller.x}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      )),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Center(
                  child: Text(
                    'Tap ${controller.x}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  )),
            ),
            GetBuilder<TapController>(
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    controller.decreaseX();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: Center(
                        child: Text(
                          'Tap ${Get.find<TapController>().count}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
