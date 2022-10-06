import 'package:branchx/app/modules/user_profile/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }

}