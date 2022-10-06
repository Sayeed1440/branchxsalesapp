import 'package:branchx/app/modules/on_board/on_board_controller.dart';
import 'package:get/get.dart';

class OnBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(() => OnBoardController());
  }

}