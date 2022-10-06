import 'package:get/get.dart';

class MaterialRequestController extends GetxController{

  List<String> filterValues = <String>['MATM Machine', 'Brochue', 'Standee'];
  List<String> sortByValues = <String>['Accepted', 'Declined', 'Pending'];

  List<int> filterIndex = [];
  int sortByIndex = 0;

  void onChangeFilter(int index){
    if(filterIndex.contains(index)){
      filterIndex.remove(index);
    }
    else{
      filterIndex.add(index);
    }
    update();
  }

  void onResetFilter(){
    filterIndex.clear();
    update();
  }

  void onChangedSortBy(int index){
    sortByIndex = index;
    update();
  }
}