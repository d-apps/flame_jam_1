import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_1/src/components/background_component.dart';
import 'package:flame_jam_1/src/components/game_over_component.dart';
import 'package:flame_jam_1/src/components/monster_component.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:flame_jam_1/src/widgets/potions_widget_controller.dart';
import 'package:flame_jam_1/src/widgets/score_widget_controller.dart';
import 'package:get/get.dart';

class FlameJam1Game extends FlameGame with HasTappableComponents {

  final double pumpkinFirstRowY = Get.height / 5;
  final double pumpkinSecondRowY = Get.height / 1.6;

  final List<PumpkinComponent> pumpkinComponents = [];

  final double firstRowY = Get.height * 0.33;
  final double secondRowY = Get.height * 0.73;

  double timeout = 5;

  int get score => Get.find<ScoreWidgetController>().score.value;

  void startGame(){

    FlameAudio.bgm.stop();
    FlameAudio.bgm.play("game_audio.wav", volume: 0.3);

    add(BackgroundComponent());

    overlays.add("Score");
    overlays.add("Potions");

    pumpkinComponents.assignAll([
      PumpkinComponent(x: Get.width * 0.27, y: firstRowY),
      PumpkinComponent(x: Get.width * 0.50, y: firstRowY),
      PumpkinComponent(x: Get.width * 0.73, y: firstRowY),

      PumpkinComponent(x: Get.width * 0.27, y: secondRowY),
      PumpkinComponent(x: Get.width * 0.50, y: secondRowY),
      PumpkinComponent(x: Get.width * 0.73, y: secondRowY),
    ]);

    pumpkinComponents.forEach((pumpkinComponent){

      add(MonsterComponent(pumpkinComponent));
      add(pumpkinComponent);

    });

    overlays.add("Back Button");

  }

  @override
  void update(double dt) {

    checkScoreToIncreaseTimeout();

    if(Get.find<PotionsWidgetController>().potions <= 0){
      gameOver();
    }

    super.update(dt);
  }

  void clearAll(){

    overlays.remove("Score");
    overlays.remove("Potions");
    overlays.remove("Back Button");

    children.clear();

    Get.find<ScoreWidgetController>().reset();
    Get.find<PotionsWidgetController>().resetPotions();
    timeout = 5;

  }

  void gameOver(){
    clearAll();
    add(GameOverComponent());
    overlays.add("Back Button");
  }

  void restartGame(){

    clearAll();
    startGame();

  }

  void backToMainScreen(){

    clearAll();
    overlays.add("Main Menu");

  }

  void checkScoreToIncreaseTimeout(){

    //print(score);
    //print(timeout);

    if(score >= 100 && score <= 200){
      timeout = 4;
    } else if(score >= 200 && score <= 300){
      timeout = 3;
    } else if(score >= 300 && score <= 400){
      timeout = 2;
    } else if(score >= 400 && score <= 500) {
      timeout = 1;
    } else if(score >= 500 && score <= 600) {
      timeout = 0.9;
    } else if(score >= 700 && score <= 800) {
      timeout = 0.8;
    } else if(score >= 800 && score <= 900) {
      timeout = 0.7;
    } else if(score >= 900 && score <= 1000) {
      timeout = 0.6;
    } else if(score >= 1000 && score <= 1100) {
      timeout = 0.5;
    } else if(score >= 1100 && score <= 1200) {
      timeout = 0.4;
    } else if(score >= 1200 && score <= 1300) {
      timeout = 0.3;
    } else if(score >= 1400 && score <= 1500) {
      timeout = 0.2;
    } else if(score >= 1500 && score <= 1600) {
      timeout = 0.1;
    } else if(score >= 1600 && score <= 1700) {
      timeout = 0.05;
    }

  }

}