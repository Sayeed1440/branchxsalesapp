import 'package:get/get.dart';

class UserProfileController extends GetxController{

  int remarkCurrent = 0;

  void onChangedRemark(int index){
    remarkCurrent = index;
    update();
  }

  bool showFullProfileContainer = false;

  void onChangedFullProfile(){
    showFullProfileContainer = !showFullProfileContainer;
    update();
  }
}
