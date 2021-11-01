import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HowToPlayWidget extends StatelessWidget {

  final FlameJam1Game gameRef;
  HowToPlayWidget(this.gameRef);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [

          Container(
            child: Image.asset(
              "assets/images/how_to_play.png",
              height: Get.height,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16
                ),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.timesCircle),
                  color: Colors.redAccent,
                  iconSize: 40,
                  onPressed: (){
                    FlameAudio.play("button_audio.wav");
                    gameRef.overlays.remove("How To Play");
                  },
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
