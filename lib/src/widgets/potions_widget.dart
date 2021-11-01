import 'package:flame_jam_1/src/widgets/potions_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotionsWidget extends StatelessWidget {

  final PotionsWidgetController potionsWidgetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        bottom: 16
      ),
      alignment: Alignment.bottomLeft,
      child: Obx(()=> Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
            potionsWidgetController.potions.value, (index) => Row(
          children: [

            Image.asset(
              "assets/images/potion.png",
              height: Get.height * 0.10,
            ),
            const SizedBox(
              width: 10,
            )

          ],
        )),
      )),
    );
  }
}
