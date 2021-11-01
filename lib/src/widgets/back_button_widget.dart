import 'package:flame_jam_1/src/flame_jam_1_game.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {

  final FlameJam1Game gameRef;
  BackButtonWidget(this.gameRef);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        bottom: 16
      ),
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(FontAwesomeIcons.arrowAltCircleLeft),
          color: Colors.orange,
          iconSize: 40,
          onPressed: () => gameRef.backToMainScreen(),
        ),
      ),
    );
  }
}
