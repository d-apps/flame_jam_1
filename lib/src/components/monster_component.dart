import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flame_jam_1/src/widgets/potions_widget_controller.dart';
import 'package:flame_jam_1/src/widgets/score_widget_controller.dart';
import 'package:get/get.dart';

class MonsterComponent extends SpriteComponent with HasGameRef<FlameJam1Game>, Tappable {

  final PumpkinComponent pumpkinComponent;
  int secondsToSpawn;
  MonsterComponent(this.pumpkinComponent, {this.secondsToSpawn = 6}) :super(priority: -1);

  bool? directionUp;
  late Timer timer;
  final double speed = 100;

  final random = Random();

  final List<String> monsters = [

    "monster_1.png",
    "monster_2.png",
    "monster_3.png",
    "monster_4.png",
    "cat.png",

  ];

  /// Need to know if cat was tapped
  late String spriteName = "";

  final PotionsWidgetController potionsWidgetController = Get.find();

  @override
  Future<void>? onLoad() async {

    spriteName = monsters[random.nextInt(5)];

    /// Pumpkin
    sprite = await Sprite.load(spriteName);

    size = Vector2(
        pumpkinComponent.width * 0.52,
        pumpkinComponent.height * 0.52
    );

    position = Vector2(
        pumpkinComponent.x - (pumpkinComponent.width / 3.6),
        pumpkinComponent.y - (pumpkinComponent.height / 2.6)
    );

    timer = Timer(gameRef.timeout, callback: () async {
      directionUp = !directionUp!;
    });

    Future.delayed(Duration(seconds: secondsToSpawn.toInt())).then((_){
      directionUp = true;
    });

    return super.onLoad();
  }

  @override
  void update(double dt) {

    timer.update(dt);

    if(directionUp != null){

      if(directionUp!){
        goUp(dt);
      } else {
        goDown(dt);
      }

    }

    super.update(dt);
  }

  void goUp(double dt) async {

    if(this.toRect().bottom <= pumpkinComponent.toRect().top + 14){

      if(!timer.isRunning()){
        timer.start();
      }

      return;
    }

    //print("up");
    position.y += -speed * dt;

  }

  void goDown(double dt) async {

    if(this.toRect().top >= pumpkinComponent.toRect().top + 12){

      if(!timer.isRunning()){
        spriteName = monsters[random.nextInt(5)];
        sprite = await Sprite.load(spriteName);
        timer.start();
        if(isSpriteCat() == false){
          potionsWidgetController.losePotion();
        }
      }

      return;
    }

    //print("down");
    position.y += speed * dt;

  }

  bool isSpriteCat() => this.spriteName == "cat.png";

  @override
  bool onTapDown(TapDownInfo info) {

    Get.find<ScoreWidgetController>().increaseScore();

    if(isSpriteCat() == false){

      if(spriteName.contains("1")){
        FlameAudio.play("monster_1_audio.wav");
      } else if(spriteName.contains("2")){
        FlameAudio.play("monster_2_audio.wav");
      } else {
        FlameAudio.play("monster_3_audio.wav");
      }

    } else {
      FlameAudio.play("cat_audio.wav");
      potionsWidgetController.losePotion();
    }

    gameRef.remove(this);
    gameRef.add(MonsterComponent(pumpkinComponent, secondsToSpawn: 3));

    return super.onTapDown(info);
  }

  double _nextDouble(int max) => random.nextDouble() * max;
  double _nextInt(int min, int max) => random.nextInt(max - min).toDouble();

}