import 'package:branchx/app/modules/remarks/remark_controller.dart';
import 'package:get/get.dart';

class RemarkBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RemarkController>(() => RemarkController());
  }

}