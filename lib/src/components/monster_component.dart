import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:get/get.dart';

class MonsterComponent extends SpriteComponent with HasGameRef<FlameJam1Game>, Tappable {

  final PumpkinComponent pumpkinComponent;
  MonsterComponent(this.pumpkinComponent) :super(priority: -1);

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
  String spriteName = "";

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

    Future.delayed(Duration(seconds: 3.toInt())).then((_){
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
        sprite = await Sprite.load(monsters[random.nextInt(5)]);
        timer.start();
      }
      /// Perde uma vida aqui

      return;
    }

    //print("down");
    position.y += speed * dt;

  }

  @override
  bool onTapDown(TapDownInfo info) {

    if(spriteName != "cat.png"){
      gameRef.score += 20;
    }

    gameRef.remove(this);
    gameRef.add(MonsterComponent(pumpkinComponent));
    return super.onTapDown(info);
  }

  double _nextDouble(int max) => random.nextDouble() * max;
  double _nextInt(int min, int max) => random.nextInt(max - min).toDouble();

}