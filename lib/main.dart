import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscapeRightOnly();
  await Flame.device.fullScreen();

  await Flame.images.loadAll(
      [
        "cat.png",
        "monster_1.png",
        "monster_2.png",
        "monster_3.png",
        "monster_4.png",
        "pumpkin.png",
      ]
  );

  runApp(GameWrapper());

}

class GameWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GameWidget(
          game: FlameJam1Game(),
          overlayBuilderMap: {
            "Pause" : (context, _) => Container(),
          },
      ),
    );
  }
}


