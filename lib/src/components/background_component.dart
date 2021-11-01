import 'package:flame/components.dart';
import 'package:get/get.dart';

class BackgroundComponent extends SpriteComponent {

  BackgroundComponent() : super(priority: -2);

  @override
  Future<void>? onLoad() async {

    sprite = await Sprite.load(
        "background.png",
    );

    position = Vector2(0, 0);
    size = Vector2(Get.width, Get.height);

    return super.onLoad();

  }

}