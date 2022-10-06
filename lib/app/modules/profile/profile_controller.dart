
import 'package:get/get.dart';

class ProfileController extends GetxController{
  int declined = 0;
  int selectedMachine = 0;
  String machine = 'MATM Machine';
  List<String> machineType = <String>['MATM Machine', 'POS Machine', 'BBPS Brochure', 'Standees', 'Signangue Board'];

  void onChangedMachineType(int index){
    selectedMachine = index;
    machine = machineType[index];
    update();
  }

  void onChangedDeclined(int index){
    declined = index;
    update();
  }

  bool showFullProfileContainer = false;

  void onChangedFullProfile(){
    showFullProfileContainer = !showFullProfileContainer;
    update();
  }
}