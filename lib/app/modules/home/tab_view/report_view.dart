import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/global_widget/select_date.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: ListView(
        children: [
          _searchTile(),
          Dimens.boxHeight25,
          _reportText(),
          _onBoardingText(),
          _userTargetTile(),
          graphTitle(),
          graphContainer(),
          _productTitle(),
          _productContainer(),
          Dimens.boxHeight64
        ],
      ),
    );
  }

  Widget _searchTile() => InkWell(
    onTap: (){
      searchBottomSheet();
    },
    child: Container(
          height: Dimens.eighty,
          width: Dimens.screenWidth,
          color: ColorsValue.primaryColor,
          child: Center(
            child: Container(
              height: Dimens.fourtyEight,
              width: Dimens.hundred * 3.35,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: Dimens.twenty,
                    color: Color(0xff9A999E),
                  ),
                  Dimens.boxWidth8,
                  Text(
                    'Search by Name,  ID,  Mob Number',
                    style: Styles.black14.copyWith(color: Color(0xff9A999E)),
                  )
                ],
              ),
            ),
          ),
        ),
  );

  Widget _reportText() => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          'Karnataka Reports',
          style: Styles.black18.copyWith(
              fontWeight: FontWeight.w600, color: const Color(0xff525255)),
        ),
      );

  Widget _onBoardingText() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          children: [
            Text(
              'Onboarding',
              style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.hundred * 0.92,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 0.7, color: ColorsValue.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Dimens.boxWidth12,
                    Text(
                      '8 Mar',
                      style: Styles.white14
                          .copyWith(color: ColorsValue.primaryColor),
                    ),
                    const Spacer(),
                    Icon(
                      CupertinoIcons.chevron_down_circle,
                      color: ColorsValue.primaryColor,
                      size: Dimens.twenty,
                    ),
                    Dimens.boxWidth12,
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _userTargetTile() => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        height: Dimens.hundred * 3.07,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.grey,
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Users',
                  style: Styles.black18.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff323139)),
                ),
                Text(
                  'Achived/Target',
                  style: Styles.black14,
                )
              ],
            ),
            Dimens.boxHeight20,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _targetTile(20, 50, 'Master Distributor'),
                _targetTile(54, 75, 'Distributor'),
                _targetTile(175, 250, 'Agent'),
              ],
            ),
          ],
        ),
      );

  Widget _targetTile(int value, int target, String title) {
    double per = value / target * 100.toInt();
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.blackGrey18,
              ),
              Text(
                '$value/$target',
                style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          Dimens.boxHeight20,
          Row(
            children: [
              Expanded(
                flex: per.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.pink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: 100 - per.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.lightPink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _targetTile1(int per1, int per2, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$per1%',
                style: Styles
                    .blackGrey12, //.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                title,
                style: Styles.blackGrey14,
              ),
              Text(
                '$per2%',
                style: Styles
                    .blackGrey12, //.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          Dimens.boxHeight20,
          Row(
            children: [
              Expanded(
                flex: 100 - per1,

                ///.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE4D8EF),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: per1, //.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.pink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Dimens.boxWidth16,
              Expanded(
                flex: per2, //.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: 100 - per2,

                ///.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: const Color(0xFfE4D8EF),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget graphTitle() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          children: [
            Text(
              ' LMTD v/s MTD',
              style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.hundred * 1.52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 0.7, color: ColorsValue.primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '8 Mar - 23 Mar',
                        style: Styles.white14
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.chevron_down_circle,
                        color: ColorsValue.primaryColor,
                        size: Dimens.twenty,
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget graphContainer() => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        // height: Dimens.hundred * 3.07,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.grey,
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              height: Dimens.hundred * 2.23,
              width: Dimens.screenWidth,
              child: _buildGradientAreaChart()
            ),
            Dimens.boxHeight16,
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFE4E4E4),
            ),
            Dimens.boxHeight16,
            Row(
              children: [
                Dimens.boxWidth40,
                Container(
                  height: 12,
                  width: 12,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4),color: ColorsValue.green,),
                ),
                Dimens.boxWidth4,
                Text(
                  'LMTD(31.4%)',
                  style: Styles.blackGrey12,
                ),
                const Spacer(),
                Container(
                  height: 12,
                  width: 12,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4),color: ColorsValue.primaryColor,),
                ),
                Dimens.boxWidth4,
                Text(
                  'MTD(48.7%)',
                  style: Styles.blackGrey12,
                ),
                Dimens.boxWidth40,
              ],
            )
          ],
        ),
      );

  Widget _productTitle() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          children: [
            Text(
              'Product Wise',
              style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.hundred * 1.52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(width: 0.7, color: ColorsValue.primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '8 Mar - 23 Mar',
                        style: Styles.white14
                            .copyWith(color: ColorsValue.primaryColor),
                      ),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.chevron_down_circle,
                        color: ColorsValue.primaryColor,
                        size: Dimens.twenty,
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _productContainer() => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        // height: Dimens.hundred * 3.07,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.grey,
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LMTD',
                  style: Styles.blackGrey12,
                ),
                Text(
                  'Products',
                  style: Styles.blackGrey14,
                ),
                Text(
                  'MTD',
                  style: Styles.blackGrey12,
                )
              ],
            ),
            Dimens.boxHeight20,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _targetTile1(45, 50, 'DMT'),
                _targetTile1(15, 4, 'MATM'),
                _targetTile1(65, 12, 'Banking'),
                _targetTile1(12, 48, 'BBPS'),
              ],
            ),
          ],
        ),
      );

  void searchBottomSheet() => Get.bottomSheet(
    barrierColor: ColorsValue.barrierColor,
    Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,
    child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: Dimens.fifty,
          width: Dimens.screenWidth,
          child: Center(
            child: InkWell(
              onTap: (){
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
          // height: Dimens.hundred * 4.21,
          width: Dimens.screenWidth,
          color: Colors.white,
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
                      'SELECT REPORTS',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Container(
                width: Dimens.screenWidth,
                // height: Dimens.hundred * 3.61,
                color: ColorsValue.lightGray,
                child: Column(
                  children: [
                    _textInputBottom('From', 'Select From Date', (){selectDate();}),
                    _textInputBottom('To', 'Select To date', (){selectDate();}),
                    _textInputBottom('User', 'Select User', (){
                      RoutesManagement.goToSearchView();
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 13),
                      child: PrimaryButton(
                        onPress: () {
                          RoutesManagement.goToSearchView();
                        },
                        text: 'FETCH REPORT',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  ),);

  Widget _textInputBottom(String title, String value, VoidCallback? onPress,) => Container(
    margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
    width: Dimens.screenWidth,
    height: Dimens.eighty,
    child: Column(
      children: [
        SizedBox(
          height: Dimens.thirtyTwo,
          width: Dimens.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.blackGrey16,
              )
            ],
          ),
        ),
        Container(
          height: Dimens.fourtyEight,
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffFFFFFF)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
              onTap: onPress,
              readOnly: true,
              style: Styles.black16.copyWith(color: const Color(0xff747378)),
              decoration: const InputDecoration(
                border: InputBorder.none,
                // hintText: value,
              ),
              initialValue: value,
            ),
          ),
        )
      ],
    ),
  );

}

Widget graphTitle() => Padding(
  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
  child: Row(
    children: [
      Text(
        ' LMTD v/s MTD',
        style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
      ),
      const Spacer(),
      InkWell(
        onTap: (){
          selectDate();
        },
        child: Container(
          height: Dimens.thirtyTwo,
          width: Dimens.hundred * 1.52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
              Border.all(width: 0.7, color: ColorsValue.primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '8 Mar - 23 Mar',
                style: Styles.white14
                    .copyWith(color: ColorsValue.primaryColor),
              ),
              Icon(
                CupertinoIcons.chevron_down_circle,
                color: ColorsValue.primaryColor,
                size: Dimens.twenty,
              )
            ],
          ),
        ),
      )
    ],
  ),
);

Widget graphContainer() => Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(20),
  height: Dimens.hundred * 3.07,
  width: Dimens.screenWidth,
  decoration: BoxDecoration(
      color: ColorsValue.grey,
      boxShadow: Styles.greyBoxShadow,
      gradient: Styles.greyLinearGradient,
      borderRadius: BorderRadius.circular(16)),
  child: Column(
    children: [
      Container(
        height: Dimens.hundred * 2.23,
        width: Dimens.screenWidth,
        child: _buildGradientAreaChart(),
      ),
      Dimens.boxHeight16,
      const Divider(
        height: 1,
        thickness: 0.5,
        color: Color(0xFFE4E4E4),
      ),
      Dimens.boxHeight10,
      Row(
        children: [
          Dimens.boxWidth40,
          Container(
            height: 12,
            width: 12,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(4),color: ColorsValue.green,),
          ),
          Dimens.boxWidth4,
          Text(
            'LMTD(31.4%)',
            style: Styles.blackGrey12,
          ),
          const Spacer(),
          Container(
            height: 12,
            width: 12,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(4),color: ColorsValue.primaryColor,),
          ),
          Dimens.boxWidth4,
          Text(
            'MTD(48.7%)',
            style: Styles.blackGrey12,
          ),
          Dimens.boxWidth40,
        ],
      )
    ],
  ),
);

SfCartesianChart _buildGradientAreaChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    // title: ChartTitle(text: isCardView ? '' : 'Annual rainfall of Paris'),
    primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.years,
        dateFormat: DateFormat.y(),
        majorGridLines: const MajorGridLines(width: 0),
        labelFormat: 'Mar{value}'
        // title: AxisTitle(text: 'Year')
    ),
    primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 100,
        interval: 20,
        axisLine: const AxisLine(width: 0),
        labelFormat: '₹ {value}K',
        majorTickLines: const MajorTickLines(size: 0)),
    series: _getGradientAreaSeries(),
    tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
  );
}

/// Returns the list of chart series
/// which need to render on the gradient area chart.
List<AreaSeries<ChartSampleData, DateTime>> _getGradientAreaSeries() {
  return <AreaSeries<ChartSampleData, DateTime>>[
    AreaSeries<ChartSampleData, DateTime>(
      /// To apply the gradient colors here.
      gradient: const LinearGradient(
        colors: [Color(0xFFA9D59B), Colors.white],
        stops: [0.4, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      dataSource: <ChartSampleData>[
        ChartSampleData(x: DateTime(1925), y: 50),
        ChartSampleData(x: DateTime(1925), y: 55),
        ChartSampleData(x: DateTime(1926), y: 58),
        ChartSampleData(x: DateTime(1927), y: 55),
        ChartSampleData(x: DateTime(1928), y: 60),
        ChartSampleData(x: DateTime(1929), y: 85),
        ChartSampleData(x: DateTime(1930), y: 60),
        ChartSampleData(x: DateTime(1931), y: 100),
        ChartSampleData(x: DateTime(1932), y: 60),
        ChartSampleData(x: DateTime(1933), y: 50),
        ChartSampleData(x: DateTime(1934), y: 60),
        ChartSampleData(x: DateTime(1935), y: 80),
        ChartSampleData(x: DateTime(1936), y: 75),
        ChartSampleData(x: DateTime(1937), y: 100),
        ChartSampleData(x: DateTime(1938), y: 50),
        ChartSampleData(x: DateTime(1939), y: 62),
        ChartSampleData(x: DateTime(1940), y: 60),
        ChartSampleData(x: DateTime(1941), y: 100),
        ChartSampleData(x: DateTime(1942), y: 90),
        ChartSampleData(x: DateTime(1943), y: 54),
        ChartSampleData(x: DateTime(1944), y: 59),
        ChartSampleData(x: DateTime(1945), y: 64)
      ],
      xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
      name: 'Annual Rainfall',
    ),
    AreaSeries<ChartSampleData, DateTime>(
      /// To apply the gradient colors here.
      gradient: const LinearGradient(
        colors: [Color(0xFF748BC5), Colors.white],
        stops: [0.6, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      dataSource: <ChartSampleData>[
        ChartSampleData(x: DateTime(1925), y: 40),
        ChartSampleData(x: DateTime(1925), y: 45),
        ChartSampleData(x: DateTime(1926), y: 48),
        ChartSampleData(x: DateTime(1927), y: 45),
        ChartSampleData(x: DateTime(1928), y: 50),
        ChartSampleData(x: DateTime(1929), y: 75),
        ChartSampleData(x: DateTime(1930), y: 50),
        ChartSampleData(x: DateTime(1931), y: 90),
        ChartSampleData(x: DateTime(1932), y: 50),
        ChartSampleData(x: DateTime(1933), y: 40),
        ChartSampleData(x: DateTime(1934), y: 50),
        ChartSampleData(x: DateTime(1935), y: 70),
        ChartSampleData(x: DateTime(1936), y: 65),
        ChartSampleData(x: DateTime(1937), y: 90),
        ChartSampleData(x: DateTime(1938), y: 40),
        ChartSampleData(x: DateTime(1939), y: 52),
        ChartSampleData(x: DateTime(1940), y: 50),
        ChartSampleData(x: DateTime(1941), y: 95),
        ChartSampleData(x: DateTime(1942), y: 80),
        ChartSampleData(x: DateTime(1943), y: 44),
        ChartSampleData(x: DateTime(1944), y: 49),
        ChartSampleData(x: DateTime(1945), y: 54)
      ],
      xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
      name: 'Annual Rainfall',
    ),

  ];
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
        this.pointColor,
        this.size,
        this.text,
        this.open,
        this.close,
        this.low,
        this.high,
        this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
