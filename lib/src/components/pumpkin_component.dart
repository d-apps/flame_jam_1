import 'package:flame/components.dart';
import 'package:get/get.dart';

class PumpkinComponent extends SpriteComponent {

  final double x;
  final double y;

  final double width = Get.width * 0.25;
  final double height = Get.height * 0.30;

  PumpkinComponent({required this.x, required this.y});

  @override
  Future<void>? onLoad() async {

    /// Pumpkin
    sprite = await Sprite.load("pumpkin.png");
    size = Vector2(width, height);
    position = Vector2(x - (width / 2), y - (height / 2));

    return super.onLoad();
  }

}