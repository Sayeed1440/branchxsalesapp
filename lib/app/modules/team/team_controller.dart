import 'package:get/get.dart';

class TeamController extends GetxController{
  String title = Get.arguments;

  int expandedIndex = -1;

  void onChangedExpandedIndex(int index){
    expandedIndex = index;
    update();
  }
}