import 'package:flame/game.dart';
import 'package:flame_jam_1/src/components/monster_component.dart';
import 'package:flame_jam_1/src/components/pumpkin_character_component.dart';
import 'package:flame_jam_1/src/components/pumpkin_component.dart';
import 'package:get/get.dart';

class FlameJam1Game extends FlameGame {

  final double pumpkinFirstRowY = Get.height / 5;
  final double pumpkinSecondRowY = Get.height / 1.6;

  final List<PumpkinCharacterComponent> pumpkinComponents = [];

  @override
  Future<void>? onLoad() {

    pumpkinComponents.addAll([
      //PumpkinComponent(x: Get.width / 3, y: pumpkinFirstRowY),
      //PumpkinCharacterComponent(x: 100, y: 100),
      //PumpkinComponent(x: Get.width * 0.54, y: pumpkinFirstRowY),
      //PumpkinComponent(x: Get.width * 0.74, y: pumpkinFirstRowY),

      //PumpkinComponent(x: Get.width * 0.14, y: pumpkinSecondRowY),
      //PumpkinComponent(x: Get.width * 0.34, y: pumpkinSecondRowY),
      //PumpkinComponent(x: Get.width * 0.54, y: pumpkinSecondRowY),
      //PumpkinComponent(x: Get.width * 0.74, y: pumpkinSecondRowY)
    ]);

    //pumpkinComponents.forEach((pumpkinComponent) => add(pumpkinComponent));

    //add(PumpkinCharacterComponent(x: Get.width / 2, y: Get.height / 2));

    final pumpkinComponent = PumpkinComponent(x: Get.width / 2, y: Get.height / 2);
    add(MonsterComponent(pumpkinComponent));
    add(pumpkinComponent);

    return super.onLoad();
  }

}