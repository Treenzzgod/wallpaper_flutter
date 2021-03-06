import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/Pages/image_view.dart';
import 'package:wallpaper_flutter/models/photo_model.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
      )
    ],
  );
}

Widget WallpapersList({required List<photoModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageView(
                        imgUrl: (wallpaper.src!.portrait)!,
                      )),
            );
          },
          child: Hero(
            tag: (wallpaper.src!.portrait)!,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    (wallpaper.src!.portrait)!,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}