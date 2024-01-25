import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contollers/tap_getx_controller.dart';
import 'first_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TapGetXController controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGestureDetector(
              controller: controller,
              onTap: () {
                controller.increaseX();
              },
              title: 'Simple ${controller.x}',
            ),
            GetBuilder<TapGetXController>(builder: (controllerTapGetX) {
              return _buildGestureDetector(
                  controller: controllerTapGetX,
                  onTap: () {
                    controllerTapGetX.increaseX();
                  },
                  title: 'controller: ${controller.x}');
            }),
            GetBuilder<TapGetXController>(builder: (controllerTapGetX) {
              return _buildGestureDetector(
                  controller: controllerTapGetX,
                  onTap: () {
                    controllerTapGetX.increaseX();
                  },
                  title: 'GetBuilder: ${controllerTapGetX.x}');
            }),
            Obx(() {
              return _buildGestureDetector(
                  controller: controller,
                  onTap: () {
                    Get.to(() => const FirstPage());
                  },
                  title: 'Go to First Page Obs: ${controller.countObs}');
            }),
            Obx(() {
              return _buildGestureDetector(
                  controller: controller,
                  onTap: () {
                    controller.increaseXObs();
                  },
                  title: 'Increase XObs: ${controller.countObs}');
            }),
            Obx(() {
              return _buildGestureDetector(
                  controller: controller,
                  onTap: () {
                    controller.goToSecondPage();
                  },
                  title: 'Go to Second Page: ${controller.countObs}');
            })
          ],
        ),
      ),
    );
  }

  static _buildGestureDetector(
      {required TapGetXController controller,
      required Function onTap,
      required String title}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
