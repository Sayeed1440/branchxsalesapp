import 'package:branchx/app/modules/edit_profile/edit_profile_view.dart';
import 'package:branchx/app/modules/home/home_binding.dart';
import 'package:branchx/app/modules/home/home_view.dart';
import 'package:branchx/app/modules/leave_request/leave_request_binding.dart';
import 'package:branchx/app/modules/leave_request/leave_request_view.dart';
import 'package:branchx/app/modules/material_request/material_request_binding.dart';
import 'package:branchx/app/modules/material_request/material_request_view.dart';
import 'package:branchx/app/modules/notification/notification_view.dart';
import 'package:branchx/app/modules/on_board/on_board_binding.dart';
import 'package:branchx/app/modules/on_board/on_board_view.dart';
import 'package:branchx/app/modules/on_board/pages/kyc.dart';
import 'package:branchx/app/modules/on_board/pages/shop_details_view.dart';
import 'package:branchx/app/modules/profile/profile_binding.dart';
import 'package:branchx/app/modules/profile/profile_view.dart';
import 'package:branchx/app/modules/regularization/regularization_view.dart';
import 'package:branchx/app/modules/remarks/remark_view.dart';
import 'package:branchx/app/modules/remarks/remark_binding.dart';
import 'package:branchx/app/modules/search/search_binding.dart';
import 'package:branchx/app/modules/search/search_view.dart';
import 'package:branchx/app/modules/login/confir_password_view.dart';
import 'package:branchx/app/modules/login/login_view.dart';
import 'package:branchx/app/modules/login/reset_password.dart';
import 'package:branchx/app/modules/team/team_binding.dart';
import 'package:branchx/app/modules/team/team_view.dart';
import 'package:branchx/app/modules/user_profile/pages/distributor_profile_view.dart';
import 'package:branchx/app/modules/user_profile/pages/more_details.dart';
import 'package:branchx/app/modules/user_profile/pages/team_view.dart';
import 'package:branchx/app/modules/user_profile/user_profile_binding.dart';
import 'package:branchx/app/modules/user_profile/user_profile_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 300,
  );

  static final pages = <GetPage>[
    GetPage<dynamic>(
      name: _Paths.login,
      transitionDuration: transitionDuration,
      page: LoginView.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.resetPassword,
      transitionDuration: transitionDuration,
      page: ResetPasswordView.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.confirmPassword,
      transitionDuration: transitionDuration,
      page: ConfirmPasswordView.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),

    GetPage<dynamic>(
      name: _Paths.search,
      transitionDuration: transitionDuration,
      page: SearchView.new,
      binding: SearchBinding(),
      transition: Transition.downToUp,
    ),

    GetPage<dynamic>(
      name: _Paths.profile,
      transitionDuration: transitionDuration,
      page: ProfileView.new,
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.editProfile,
      transitionDuration: transitionDuration,
      page: EditProfileView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.notification,
      transitionDuration: transitionDuration,
      page: NotificationView.new,
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.onBoard,
      transitionDuration: transitionDuration,
      page: OnBoardView.new,
      binding: OnBoardBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.shopDetails,
      transitionDuration: transitionDuration,
      page: ShopDetailsView.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.kyc,
      transitionDuration: transitionDuration,
      page: PersonalKYC.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.userProfile,
      transitionDuration: transitionDuration,
      page: UserProfileView.new,
      binding: UserProfileBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.materialRequest,
      transitionDuration: transitionDuration,
      page: MaterialRequest.new,
      binding: MaterialRequestBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.remarks,
      transitionDuration: transitionDuration,
      page: Remarks.new,
      binding: RemarkBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.regularization,
      transitionDuration: transitionDuration,
      page: Regularization.new,
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.leaveRequest,
      transitionDuration: transitionDuration,
      page: LeaveRequest.new,
      binding: LeaveRequestBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.teamView,
      transitionDuration: transitionDuration,
      page: UserProfileTeamView.new,
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.distributorProfileView,
      transitionDuration: transitionDuration,
      page: DistributorProfileView.new,
      binding: UserProfileBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage<dynamic>(
      name: _Paths.moreInfo,
      transitionDuration: transitionDuration,
      page: MoreDetails.new,
      transition: Transition.rightToLeft,
    ),
    GetPage<dynamic>(
      name: _Paths.searchTeam,
      transitionDuration: transitionDuration,
      page: TeamView.new,
      binding: TeamBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
