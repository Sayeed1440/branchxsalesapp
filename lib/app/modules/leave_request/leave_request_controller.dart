import 'package:get/get.dart';

class LeaveRequestController extends GetxController{

  List<String> filterValues = <String>['Cluster', 'District Heads', 'Sales Executives'];
  List<String> sortByValues = <String>['Casual Leave', 'Sick Leave', 'Accepted', 'Declined', 'Pending'];

  List<int> filterIndex = [];
  int sortByIndex = 0;

  void onChangeFilter(int index){
    if( filterIndex.contains(index)){
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
  List<String> leaveRequest = <String>['Accepted', 'Declined', 'Request', 'Accepted', 'Declined', 'Request'];
}