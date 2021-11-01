import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/widgets.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuWidget extends StatefulWidget {

  final FlameJam1Game gameRef;
  MainMenuWidget(this.gameRef);

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {

  final List<Sprite> spriteList = [];

  Future<void> loadSprites() async {

    final List<String> assets = [
      "menu_1.png",
      "menu_2.png",
      "menu_3.png",
      "menu_4.png",
    ];

    for(String asset in assets){

      spriteList.add(
          await Sprite.load(
              asset,
              srcPosition: Vector2(0, 0),
              //srcSize: Vector2(1280, 720),
          )
      );

    }

  }

  @override
  void initState() {
    FlameAudio.bgm.play("menu_audio.wav", volume: 0.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: loadSprites(),
        builder: (_, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){

            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white
                ),
              ),
            );

          } else {

            final SpriteAnimation spriteAnimation = SpriteAnimation.spriteList(
                spriteList,
                stepTime: 0.80,

            );

            return Stack(
              children: [

                Container(
                  height: Get.height,
                  width: Get.width,
                  child: SpriteAnimationWidget(
                      animation: spriteAnimation,
                      anchor: Anchor.topCenter,
                  ),
                ),

                Positioned.fill(
                  child: Align(
                    alignment: Alignment(
                      -0.6,
                      -0.4
                    ),
                    child: InkWell(
                      child: Image.asset(
                        "assets/images/play_button.png",
                        height: Get.height * 0.13,
                        width: Get.width * 0.33,
                      ),
                      onTap: (){

                        FlameAudio.play("button_audio.wav");
                        widget.gameRef.overlays.remove("Main Menu");
                        FlameAudio.bgm.stop();
                        widget.gameRef.startGame();


                      },
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Align(
                    alignment: Alignment(
                        -0.6,
                         -0.05
                    ),
                    child: InkWell(
                      child: Image.asset(
                        "assets/images/how_to_play_button.png",
                        height: Get.height * 0.13,
                        width: Get.width * 0.33,
                      ),
                      onTap: (){

                        FlameAudio.play("button_audio.wav");
                        widget.gameRef.overlays.add("How To Play");

                      },
                    ),
                  ),
                ),

                /*
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(
                        -0.6,
                        0.30
                    ),
                    child: InkWell(
                      child: Image.asset(
                        "assets/images/exit_button.png",
                        height: Get.height * 0.13,
                        width: Get.width * 0.33,
                      ),
                      onTap: (){

                        FlameAudio.bgm.stop();
                        FlameAudio.bgm.dispose();
                        exit(0);

                      },
                    ),
                  ),
                )
                 */

              ],
            );

          }


        },
      ),
    );
  }
}
