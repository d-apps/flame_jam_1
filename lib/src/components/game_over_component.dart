import 'package:flame/components.dart';
import 'package:get/get.dart';

class GameOverComponent extends SpriteComponent {

  @override
  Future<void>? onLoad() async {

    sprite = await Sprite.load("gameover_background.png");
    position = Vector2(0, 0);
    size = Vector2(Get.width, Get.height);

    return super.onLoad();

  }

}