import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:sample_app/Controller/maincontroller.dart';

class FullSizePhoto extends StatefulWidget {
  final String image;
  const FullSizePhoto({super.key, required this.image});

  @override
  State<FullSizePhoto> createState() => _FullSizePhotoState();
}

class _FullSizePhotoState extends State<FullSizePhoto> {
  // Future<void> setWalpaper() async {
  //   int location = WallpaperManager.BOTH_SCREEN;
  //   var file = await DefaultCacheManager().getSingleFile(widget.image);
  //   // ignore: unused_local_variable
  //   String result =
  //       (await WallpaperManager.setWallpaperFromFile(file.path, location))
  //           as String;
  // }
  Future<void> setWallpaper() async {
    try {
      int location = WallpaperManager.BOTH_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(widget.image);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      if (kDebugMode) {
        print(result);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setWallpaper();
                    },
                    child: const Text(
                      'Set Wallpaper',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (mainController.favWallpaper.contains(widget.image)) {
                        Get.showSnackbar(
                          const GetSnackBar(
                            message: "Already Added!",
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(seconds: 1),
                            backgroundColor: Color.fromARGB(255, 248, 110, 100),
                          ),
                        );
                      } else {
                        mainController.addToFav(widget.image);
                        Get.showSnackbar(
                          const GetSnackBar(
                            message: "Successfully Added",
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Favourite',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
