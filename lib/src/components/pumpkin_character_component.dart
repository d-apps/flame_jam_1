import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_jam_1/src/components/monster_component.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PumpkinCharacterComponent extends PositionComponent  {

  final double x;
  final double y;
  PumpkinCharacterComponent({required this.x, required this.y});

  late SpriteComponent pumpkinSpriteComponent;
  final double pumpkinWidth = Get.width * 0.40;
  final double pumpkinHeight = Get.height * 0.40;
  late SpriteComponent monsterSpriteComponent;

  /*
    bool directionUp = true;
  late Timer timer;
  final double speed = 100;
   */

  @override
  Future<void>? onLoad() async {

    pumpkinSpriteComponent = SpriteComponent(
      position: Vector2(x - (pumpkinWidth / 2), y - (pumpkinHeight / 2)),
      size: Vector2(pumpkinWidth, pumpkinHeight),
      sprite: await Sprite.load("pumpkin.png")
    );

    monsterSpriteComponent = SpriteComponent(
      position: Vector2(100, 0),
      size: Vector2(Get.width * 0.30, Get.height * 0.30),
      sprite: await Sprite.load("monster_1.png")
    );

    //timer = Timer(3, callback: () => directionUp = !directionUp);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {

    monsterSpriteComponent.render(canvas);
    pumpkinSpriteComponent.render(canvas);


    /*
    sprite!.render(
        canvas,
    );
     */

    //canvas.drawRect(pumpkinRect, paint);
    //canvas.drawRect(characterRect, paint2);


    super.render(canvas);
  }

  /*
  @override
  void update(double dt) {

    //timer.update(dt);

    if(directionUp){
      //goUp(dt);
    } else {
      //goDown(dt);
    }

    super.update(dt);
  }

  void goUp(double dt){

    /*
    if(characterRect.bottom <= (pumpkinRect.top + 2)){
      if(!timer.isRunning()){
        timer.start();
      }
      return;
    }

    //print("up");
    characterRect = characterRect.translate(0, -speed * dt);
     */
  }

  void goDown(double dt){

    /*
    if(characterRect.top >= (pumpkinRect.top + 2)){
      if(!timer.isRunning()){
        timer.start();
      }
      return;
    }

    //print("down");
    characterRect = characterRect.translate(0, speed * dt);
     */
  }
   */

}