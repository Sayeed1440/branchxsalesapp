import 'package:branchx/app/modules/leave_request/leave_request_controller.dart';
import 'package:get/get.dart';

class LeaveRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequestController>(() => LeaveRequestController());
  }

}