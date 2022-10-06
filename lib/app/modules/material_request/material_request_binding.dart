import 'package:branchx/app/modules/material_request/material_request_controller.dart';
import 'package:get/get.dart';

class MaterialRequestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MaterialRequestController>(() => MaterialRequestController());
  }

}