import 'package:branchx/app/modules/search/search_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsValue.blackGrey,
            )),
        iconTheme: const IconThemeData(color: ColorsValue.blackGrey),
        title: Text(
          'Search',
          style: Styles.blackGrey14,
        ),
      ),
      body: GetBuilder<SearchController>(builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchTile(),
              Dimens.boxHeight4,
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Searches',
                      style: Styles.black18.copyWith(
                          color: const Color(0xff525255),
                          fontWeight: FontWeight.w500),
                    ),
                    Dimens.boxHeight12,
                    Wrap(
                      runSpacing: 16,
                      spacing: 12,
                      children: List.generate(
                          logic.recentSearch.length,
                          (index) => Container(
                                height: Dimens.thirtySix,
                                // width: Dimens.hundred*1.32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: Styles.greyLinearGradient,
                                    boxShadow: Styles.greyBoxShadow,
                                    // border: Border.all(color: ColorsValue.primaryColor),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 11),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        logic.recentSearch[index],
                                        style: Styles.black14.copyWith(
                                            color: Color(0xff525255)),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: Text(
                  'Categories',
                  style: Styles.black18.copyWith(
                      color: const Color(0xff525255),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: List.generate(
                    logic.categoriesList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: (){
                          RoutesManagement.goToSearchTeamView(logic.categoriesList[index]);
                        },
                        child: Container(
                              margin: const EdgeInsets.only(top: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              height: Dimens.fifty,
                              width: Dimens.screenWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: Styles.greyLinearGradient,
                                  boxShadow: Styles.greyBoxShadow,
                                  // border: Border.all(color: ColorsValue.primaryColor),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Text(
                                    logic.categoriesList[index],
                                    style: Styles.black16
                                        .copyWith(color: const Color(0xff525255))),
                                  const Spacer(),
                                  Text(
                                      '31',
                                      style: Styles.black16
                                          .copyWith(color: const Color(0xff525255), fontWeight: FontWeight.w500)),
                                  Dimens.boxWidth20,
                                  Icon(Icons.arrow_forward_ios, color: ColorsValue.primaryColor, size: Dimens.twelve,)
                                ],
                              ),
                            ),
                      ),
                    )),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _searchTile() => Container(
        height: Dimens.eighty,
        width: Dimens.screenWidth,
        color: ColorsValue.primaryColor,
        child: Center(
          child: Container(
            height: Dimens.fourtyEight,
            width: Dimens.hundred * 3.35,
            constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
            child: CupertinoTextField(
                // onChanged: (value) => logic.onChangedPhone(value),
                padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                ),
                cursorColor: ColorsValue.secondaryColor,
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.name,
                maxLines: 1,
                placeholder: 'Search by Name,  ID,  Mob Number',
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                ),
                placeholderStyle: Styles.black14.copyWith(color: Colors.grey)),
          ),
        ),
      );
}
