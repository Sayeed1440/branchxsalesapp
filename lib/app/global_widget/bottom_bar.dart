import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/// A bottom navigation widget which will be used on the home page
/// for showing multiple navigation points.
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.1, color: Colors.grey),
            ),
          ),
          child: BottomNavigationBar(
            iconSize: Dimens.twentyFour,
            elevation: 0,
            selectedLabelStyle: Styles.styleLato12Bold,
            type: BottomNavigationBarType.fixed,
            currentIndex: _controller.currentTab,
            onTap: (index) {
              _controller.changeTab(index);
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: ColorsValue.black,
            unselectedItemColor: ColorsValue.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: _controller.tab!,
          ),
        ),
      );
}
