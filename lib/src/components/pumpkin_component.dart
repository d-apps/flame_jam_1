import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Direction { UP, DOWN }

class PumpkinComponent extends PositionComponent {

  final double x;
  final double y;
  PumpkinComponent({required this.x, required this.y});

  late Paint paint;
  late Paint paint2;

  late Rect pumpkinRect;
  late Rect characterRect;

  bool dirUp = true;
  late Timer timer;
  final double speed = 100;

  late double characterWidth;
  late double characterHeight;

  late double pumpkinWidth;
  late double pumpkinHeight;

  @override
  Future<void>? onLoad() {

    characterWidth = Get.width * 0.05;
    characterHeight = Get.height * 0.10;

    pumpkinWidth = Get.width * 0.12;
    pumpkinHeight = Get.height * 0.22;

    paint = Paint()..color = Colors.orange;
    paint2 = Paint()..color = Colors.blue;

    pumpkinRect = Rect.fromLTWH(
        x,
        y,
        pumpkinWidth,
        pumpkinHeight
    );

    characterRect = Rect.fromLTWH(
        x + (pumpkinWidth / 2 - (characterWidth / 2)),
        y,
        characterWidth,
        characterHeight
    );

    timer = Timer(3, callback: () => dirUp = !dirUp);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {

    canvas.drawRect(pumpkinRect, paint);
    canvas.drawRect(characterRect, paint2);

    super.render(canvas);
  }

  @override
  void update(double dt) {

    timer.update(dt);

    if(dirUp){
      goUp(dt);
    } else {
      goDown(dt);
    }

    super.update(dt);
  }

  void goUp(double dt){

    if(characterRect.bottom <= pumpkinRect.top){
      if(!timer.isRunning()){
        timer.start();
      }
      return;
    }

    //print("up");
    characterRect = characterRect.translate(0, -speed * dt);
  }

  void goDown(double dt){

    if(characterRect.top >= pumpkinRect.top){
      if(!timer.isRunning()){
        timer.start();
      }
      return;
    }

    //print("down");
    characterRect = characterRect.translate(0, speed * dt);
  }

}