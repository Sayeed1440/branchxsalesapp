import 'package:branchx/app/modules/team/team_controller.dart';
import 'package:get/get.dart';

class TeamBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TeamController>(() => TeamController());
  }

}