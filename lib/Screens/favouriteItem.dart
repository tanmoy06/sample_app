import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Controller/maincontroller.dart';

import 'fullSize.dart';

class FavItem extends StatefulWidget {
  const FavItem({super.key});

  @override
  State<FavItem> createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: GridView.builder(
                itemCount: mainController.favWallpaper.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullSizePhoto(
                            image: mainController.favWallpaper[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      child: Image.network(
                        mainController.favWallpaper[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
