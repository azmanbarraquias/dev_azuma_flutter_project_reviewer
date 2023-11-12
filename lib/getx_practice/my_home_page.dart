import 'package:DevAzuma/getx_practice/first_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contollers/tap_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller = Get.put(TapController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<TapController>(
                builder: (_) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    height: 50,
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
              GetBuilder<TapController>(
                builder: (tapController) {
                  return GestureDetector(
                    onTap: () {
                      controller.increaseX();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        'Tap ${tapController.x}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      )),
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const FirstPage());
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: const Center(
                      child: Text(
                    'Got to first page',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  )),
                ),
              ),
              Obx((){
                return GestureDetector(
                  onTap: () {
                    controller.increaseXObs();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Center(
                        child: Text(
                          'Tap${controller.count.value}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )),
                  ),
                );
              }),
              Obx((){
                return GestureDetector(
                  onTap: () {
                    controller.goToSecondPage();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: Center(
                        child: Text(
                          'Tap${controller.count}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )),
                  ),
                );
              })



            ],
          ),
        ),
      ),
    );
  }
}
