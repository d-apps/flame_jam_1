import 'package:flame/game.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:get/get.dart';

class Position {
  Position(this.left, this.top);
  final double left;
  final double top;
}

class FlameJam1Game extends FlameGame {

  double pumpkinFirstRowY = Get.height / 6;
  double pumpkinSecondRowY = Get.height / 1.7;

  final List<PumpkinComponent> pumpkinComponents = [];

  @override

  Future<void>? onLoad() {

    pumpkinComponents.addAll([
      PumpkinComponent(x: Get.width * 0.13, y: pumpkinFirstRowY),
      PumpkinComponent(x: Get.width * 0.33, y: pumpkinFirstRowY),
      PumpkinComponent(x: Get.width * 0.53, y: pumpkinFirstRowY),
      PumpkinComponent(x: Get.width * 0.73, y: pumpkinFirstRowY),

      PumpkinComponent(x: Get.width * 0.13, y: pumpkinSecondRowY),
      PumpkinComponent(x: Get.width * 0.33, y: pumpkinSecondRowY),
      PumpkinComponent(x: Get.width * 0.53, y: pumpkinSecondRowY),
      PumpkinComponent(x: Get.width * 0.73, y: pumpkinSecondRowY)
    ]);

    pumpkinComponents.forEach((pumpkinComponent) => add(pumpkinComponent));

    return super.onLoad();
  }

}