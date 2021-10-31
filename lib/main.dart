import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flame_jam_1/src/widgets/back_button_widget.dart';
import 'package:flame_jam_1/src/widgets/how_to_play_widget.dart';
import 'package:flame_jam_1/src/widgets/main_menu_widget.dart';
import 'package:flame_jam_1/src/widgets/potions_widget.dart';
import 'package:flame_jam_1/src/widgets/potions_widget_controller.dart';
import 'package:flame_jam_1/src/widgets/score_widget.dart';
import 'package:flame_jam_1/src/widgets/score_widget_controller.dart';
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

        "exit_button.png",
        "how_to_play_button.png",
        "play_button.png",
      ]
  );

  FlameAudio.bgm.initialize();

  Get.put(ScoreWidgetController());
  Get.put(PotionsWidgetController());

  runApp(GameWrapper());

}

class GameWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(
          game: FlameJam1Game(),
          initialActiveOverlays: [
            "Main Menu"
          ],
          overlayBuilderMap: {
            "Main Menu" : (context, FlameJam1Game gameRef) => MainMenuWidget(gameRef),
            "Score" : (context, FlameJam1Game gameRef) => ScoreWidget(),
            "Potions" : (context, FlameJam1Game gameRef) => PotionsWidget(),
            "How To Play" : (context, FlameJam1Game gameRef) => HowToPlayWidget(gameRef),
            "Back Button" : (context, FlameJam1Game gameRef) => BackButtonWidget(gameRef),
          },
      ),
    );
  }
}


