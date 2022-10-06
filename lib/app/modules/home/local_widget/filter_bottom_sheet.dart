import 'package:branchx/app/global_widget/sort_by_indicator.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void filterBottomSheet() => Get.bottomSheet(
      Container(
        width: Dimens.screenWidth,
        height: Dimens.hundred * 3.90,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: Dimens.fifty,
              width: Dimens.screenWidth,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Dimens.fourty,
                    width: Dimens.fourty,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: Dimens.hundred * 3.35,
              width: Dimens.screenWidth,
              color: ColorsValue.lightGray,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: Dimens.fourty,
                    width: Dimens.screenWidth,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'FILTERS',
                          style: Styles.black14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Clusters',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'District Heads',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Sales Executives',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Master Distributor',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Distributor',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Agents',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Container(
                          height: Dimens.twenty,
                          width: Dimens.twenty,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Dimens.fourty,
                          width: Dimens.hundred * 1.38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: ColorsValue.primaryColor),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            'RESET',
                            style: Styles.white16.copyWith(
                                color: ColorsValue.primaryColor,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        Container(
                          height: Dimens.fourty,
                          width: Dimens.hundred * 1.38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorsValue.loginButtonColor),
                          child: Center(
                              child: Text('APPLY',
                                  style: Styles.white16
                                      .copyWith(fontWeight: FontWeight.w600))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

void sortByBottomSheet() => Get.bottomSheet(
      Container(
        width: Dimens.screenWidth,
        height: Dimens.hundred * 1.90,
        color: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: Dimens.fifty,
              width: Dimens.screenWidth,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Dimens.fourty,
                    width: Dimens.fourty,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: Dimens.hundred * 1.30,
              width: Dimens.screenWidth,
              color: ColorsValue.lightGray,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: Dimens.fourty,
                    width: Dimens.screenWidth,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'SORT BY',
                          style: Styles.black14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Top Performer',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Container(
                              height: Dimens.sixTeen,
                              width: Dimens.sixTeen,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                            ),
                            Positioned(
                              left: Dimens.four,
                              right: Dimens.four,
                              top: Dimens.four,
                              bottom: Dimens.four,
                              child: Container(
                                height: Dimens.eight,
                                width: Dimens.eight,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Row(
                      children: [
                        Text(
                          'Least Performer',
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Container(
                              height: Dimens.sixTeen,
                              width: Dimens.sixTeen,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xff7CA26F))),
                            ),
                            Positioned(
                              left: Dimens.four,
                              right: Dimens.four,
                              top: Dimens.four,
                              bottom: Dimens.four,
                              child: Container(
                                height: Dimens.eight,
                                width: Dimens.eight,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff7CA26F)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

void sortPerformanceByBottomSheet() => Get.bottomSheet(
  GetBuilder<HomeController>(
    builder: (logic) {
      return Container(
        width: Dimens.screenWidth,
        height: Dimens.hundred * 1.80,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: Dimens.fifty,
              width: Dimens.screenWidth,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Dimens.fourty,
                    width: Dimens.fourty,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: Dimens.hundred * 1.30,
              width: Dimens.screenWidth,
              color: ColorsValue.lightGray,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: Dimens.fourty,
                    width: Dimens.screenWidth,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'SORT BY',
                          style: Styles.black14,
                        )
                      ],
                    ),
                  ),
                  for (int i = 0; i < logic.performanceSortValue.length; i++)
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 16),
                      child:    InkWell(
                        onTap: () {
                          logic.onChangedSortPerformanceIndex(i);
                        },
                        child: Row(
                          children: [
                            Text(
                              logic.performanceSortValue[i],
                              style: Styles.blackGrey14,
                            ),
                            const Spacer(),
                            sortByIndicator(
                              logic.sortPerformanceIndex == i
                                  ? ColorsValue.green
                                  : Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      );
    }
  ),
);
