import 'package:get/get.dart';

class PotionsWidgetController extends GetxController {

  final potions = 6.obs;

  void resetPotions() => potions.value = 6;
  void losePotion(){

    if(potions.value > 0){
      potions.value -= 1;
    }

  }

}