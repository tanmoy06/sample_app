import 'package:get/get.dart';

class MainController extends GetxController {
  RxList favWallpaper = [].obs;

  void addToFav(String value) {
    favWallpaper.add(value);
  }

  void removeFromFav(int index) {
    favWallpaper.remove(index);
  }
}
