import 'package:get/get.dart';

class RemarkController extends GetxController{
  int sortByIndex = 0;

  List<String> sortByValues = <String>['Cluster', 'District Head', 'Sales Executives',];

  void onChangedSortBy(int index){
    sortByIndex = index;
    update();
  }
}