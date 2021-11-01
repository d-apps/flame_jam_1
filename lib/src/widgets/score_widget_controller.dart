import 'package:get/get.dart';

class ScoreWidgetController extends GetxController {

  final score = 0.obs;

  void increaseScore(){

    score.value += 20;

  }

  void reset(){

    score.value = 0;
  }


}