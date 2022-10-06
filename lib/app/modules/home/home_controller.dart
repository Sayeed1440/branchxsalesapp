import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/constants/string.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentTab = 0;
  int usertype = 0;
  int performanceIndex = 0;

  int sortPerformanceIndex = 0;
  List<String> performanceSortValue = <String>['Agents', 'Sale Executives'];
  void onChangedSortPerformanceIndex(int index){
    sortPerformanceIndex = index;
    update();
  }

  void onChangeUsertype( int index){
    usertype = index;
    update();
  }

  /// Function used to change the [currentTab]
  void changeTab(int index) {
    currentTab = index;
    update();
  }

  void onChangedPerformanceTab(int index){
    performanceIndex = index;
    update();
  }

  /// List of Tab in [HomeView] Screen
  List<BottomNavigationBarItem>? tab = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: AppIcons.home,
      label: StringValues.home,
    ),
    BottomNavigationBarItem(
      icon: AppIcons.team,
      label: StringValues.team,
    ),
    BottomNavigationBarItem(
      icon: AppIcons.report,
      label: StringValues.report,
    ),
    BottomNavigationBarItem(
      icon: AppIcons.attendance,
      label: StringValues.attendance,
    ),
  ];

  int reportCurrent = 0;
  int recentCurrent = 0;
  int leaveCurrent = 0;
  int regularCurrent = 0;

  final CarouselController recent = CarouselController();
  final CarouselController leave = CarouselController();
  final CarouselController regular = CarouselController();


  void onChangeRecent(int index){
    recentCurrent = index;
    update();
  }

  void onChangedLeave(int index){
    leaveCurrent = index;
    update();
  }

  void onChangedRegular(int index){
    regularCurrent = index;
    update();
  }

  void onChangedReport(int index){
    reportCurrent = index;
    update();
  }

  ///--------------------------------Team Tab------------------------------------\\\
  int expandedIndex = -1;

  void onChangedExpandedIndex(int index){
    expandedIndex = index;
    update();
  }

  ///--------------------------------Team Tab------------------------------------\\\


  List<String> filterValues = <String>['Cluster', 'District Heads', 'Sales Executives', 'Master Distributor', 'Distributor', 'Agents'];
  List<String> sortByValues = <String>['Top Performer', 'Least Performer'];

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

///--------------------------------Attendance Tab------------------------------------\\\
  bool isUploaded = false;

  int sortAttendanceIndex = 0;
  int selectLeaveType = 0;
  int selectRegularizeType = 0;
  int expandedIndexAttendance = -1;



  String lea = 'Casual Leave(4d)';
  String regularize = 'Biometric Mailfunction';

  List<String> regularizeType = <String>['Biometric Mailfunction', 'Forgot to punch', 'Late Working', 'No Internet', 'Urgent Work delay', 'Other'];
  List<String> leaveType = <String>['Casual Leave(4d)', 'Earned Leave(7.5d)', 'Hobby Leave', 'Leave with out pay', 'Madatory Earned Leave', 'Optional Holiday', 'Sick leave(1.5d', "Special Moment's Leave"];
  List <String> sortAttendance = ['Last 7 day', 'Last 15 day', 'Custom'];

  List<List<dynamic>> attendanceData = <List<dynamic>>[
    [true,  '01-Mon ', '9h 45m', 'P'],
    [true,  '02-Tus ', '9h 45m', 'P'],
    [false, '01-Wed ', '9h 45m', 'A'],
    [false, '01-Thru', '9h 45m', 'L'],
    [false, '01-Sat ', '9h 45m', 'P'],
    [false, '01-Sun ', '9h 45m', 'A'],
  ];

  void onChangedExpandedIndexAttendance(int index){
    if( index == expandedIndexAttendance){
      expandedIndexAttendance = -1;
    }
    else{
      expandedIndexAttendance = index;
    }
    update();
  }

  void onChangedAttendance(int index, bool value){
    attendanceData[index][0] = value;
    update();
  }

  void onChangedUpload(){
    isUploaded = !isUploaded;
    update();
  }

  void onChangedMachineType(int index){
    selectLeaveType = index;
    lea = leaveType[index];
    update();
  }

  void onChangedRegularizeType(int index){
    selectRegularizeType = index;
    regularize = regularizeType[index];
    update();
  }

  void onChangedSortAttendance(int index){
    sortAttendanceIndex = index;
    update();
  }
}