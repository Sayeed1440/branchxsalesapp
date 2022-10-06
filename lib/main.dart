import 'package:branchx/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/constants/string.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/colors.dart';

/// Main entry of the application
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await initServices();
    runApp(const MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

bool isLogin = false;

/// Initialize the services before the app starts.
Future<void> initServices() async {
  // await Get.find<CommonService>().box.remove('token');
}

/// A class to create the initial structure of the
/// application and adds routes in the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 745),
    builder: (BuildContext context, child) => GetMaterialApp(
      title: StringValues.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorsValue.primaryColorSwatch,
        scaffoldBackgroundColor: ColorsValue.lightScaffoldColor,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login
    ),
  );
}
