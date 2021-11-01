import 'package:flame_jam_1/src/widgets/score_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreWidget extends StatelessWidget {

  final ScoreWidgetController scoreWidgetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.topCenter,
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Score: ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
            Obx(()=> Text(
              scoreWidgetController.score.value.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              )
              ,))

          ],
        ),
      ),
    );
  }
}

