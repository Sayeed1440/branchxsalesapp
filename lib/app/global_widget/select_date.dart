import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

void selectDate() => Get.dialog(
  Dialog(
      child: Padding(
        padding: Dimens.edgeInsets16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: ColorsValue.black,
                  ),
                ),
              ],
            ),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay:
              DateTime.now().add(const Duration(days: 60, hours: 23)),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (value1, value2) {
                // if (logic.selectedDays.contains(value1)) {
                //   logic.clickOnOrderDate(value1);
                // }
              },
              // selectedDayPredicate: (day) =>
              //     logic.selectedDays.contains(day),
              pageJumpingEnabled: false,
              headerStyle: HeaderStyle(
                titleTextStyle: Styles.styleLato18Bold.copyWith(
                  color: ColorsValue.primaryColor,
                ),
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonVisible: false,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: Styles.styleLato12Bold.copyWith(
                  color: ColorsValue.primaryColor,
                ),
                weekendStyle: Styles.styleLato12Bold.copyWith(
                  color: ColorsValue.primaryColor,
                ),
              ),
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                outsideDaysVisible: false,
                selectedTextStyle: Styles.black12,
                selectedDecoration: const BoxDecoration(
                  color: ColorsValue.primaryColorLight,
                  shape: BoxShape.rectangle,
                ),
                todayDecoration: const BoxDecoration(
                  color: ColorsValue.primaryColor,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Dimens.boxHeight8,
            // RoundedFilledBtn(
            //   onTap: Get.back,
            //   child: Text(
            //     StringValues.next.toUpperCase(),
            //     style: Styles.styleLato16Bold.copyWith(
            //       letterSpacing: .38,
            //       color: ColorsValue.lightGray,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ),

  barrierDismissible: false,
);
