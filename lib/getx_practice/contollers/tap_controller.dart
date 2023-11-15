import 'package:get/get.dart';

import '../second_page.dart';

class TapController extends GetxController {
  int _x = 0;

  int get x => _x;
  var count = 0.obs;

  void increaseX() {
    _x++;
    update(); // required to see the changes
    print(_x);
  }

  void decreaseX() {
    _x--;
    update(); // required to see the changes
    print(_x);
  }

  void increaseXObs() {
    count++;
    print(count);
  }

  void decreaseXObs() {
    count--;
    print(count);
  }

  void goToSecondPage() {
    Get.to(() => const SecondPage());
  }
}
