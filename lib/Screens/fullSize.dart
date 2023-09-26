import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullSizePhoto extends StatefulWidget {
  final String image;
  const FullSizePhoto({super.key, required this.image});

  @override
  State<FullSizePhoto> createState() => _FullSizePhotoState();
}

class _FullSizePhotoState extends State<FullSizePhoto> {
  Future<void> setWalpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.image);
    // ignore: unused_local_variable
    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, location))
            as String;
  }

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
          InkWell(
            onTap: () {
              setWalpaper();
            },
            child: Container(
              height: 40,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
