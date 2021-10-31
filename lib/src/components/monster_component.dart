import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:get/get.dart';

class MonsterComponent extends SpriteComponent with HasGameRef {

  final PumpkinComponent pumpkinComponent;
  MonsterComponent(this.pumpkinComponent);

  bool directionUp = true;
  late Timer timer;
  final double speed = 200;

  final random = Random();

  final List<String> monsters = [

    "monster_1.png",
    "monster_2.png",
    "cat.png",
    "monster_3.png",
    "monster_4.png",
    "cat.png",

  ];

  @override
  Future<void>? onLoad() async {

    /// Pumpkin
    sprite = await Sprite.load(monsters[random.nextInt(5)]);

    size = Vector2(
        pumpkinComponent.width * 0.52,
        Get.height * 0.20
    );

    position = Vector2(
        pumpkinComponent.x - (pumpkinComponent.width / 3.6),
        pumpkinComponent.y - (pumpkinComponent.height / 2.6)
    );

    timer = Timer(1, callback: () async {
      directionUp = !directionUp;
    });

    return super.onLoad();
  }

  @override
  void update(double dt) {

    timer.update(dt);

    if(directionUp){
      goUp(dt);
    } else {
      goDown(dt);
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
        sprite = await Sprite.load(monsters[random.nextInt(5)]);
        timer.start();
      }
      return;
    }

    //print("down");
    position.y += speed * dt;

  }

}