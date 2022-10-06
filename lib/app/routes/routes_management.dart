import 'package:branchx/app/routes/app_pages.dart';
import 'package:get/get.dart';


abstract class RoutesManagement {
  static void goToLoginView() {
    Get.offAllNamed<void>(AppRoutes.login);
  }
  static void goToResetPasswordView() {
    Get.offAllNamed<void>(AppRoutes.resetPassword);
  }
  static void goToConfirmPasswordView() {
    Get.offAllNamed<void>(AppRoutes.confirmPassword);
  }
  static void goToHomeView() {
    Get.offAllNamed<void>(AppRoutes.home);
  }

  static void goToSearchView() {
    Get.toNamed<void>(AppRoutes.search);
  }

  static void goToProfileView() {
    Get.toNamed<void>(AppRoutes.profile);
  }

  static void goToEditProfileView() {
    Get.toNamed<void>(AppRoutes.editProfile);
  }

  static void goToNotificationView() {
    Get.toNamed<void>(AppRoutes.notification);
  }

  static void goToonBoardView(int userTpe) {
    Get.toNamed<void>(AppRoutes.onBoard, arguments: userTpe);
  }

  static void goToShopDetailsView() {
    Get.toNamed<void>(AppRoutes.shopDetails,);
  }

  static void goToKycView() {
    Get.toNamed<void>(AppRoutes.kyc,);
  }

  static void goToUserProfileView() {
    Get.toNamed<void>(AppRoutes.userProfile,);
  }
  static void goToMaterialRequestView() {
    Get.toNamed<void>(AppRoutes.materialRequest,);
  }

  static void goToRemarkView() {
    Get.toNamed<void>(AppRoutes.remarks,);
  }
  static void goToRegularizationView() {
    Get.toNamed<void>(AppRoutes.regularization,);
  }
  static void goToLeaveRequestView() {
    Get.toNamed<void>(AppRoutes.leaveRequest,);
  }

  static void goToUserProfileTeamView() {
    Get.toNamed<void>(AppRoutes.teamView,);
  }

  static void goToMoreInfoView() {
    Get.toNamed<void>(AppRoutes.moreInfo,);
  }

  static void goToDistributorUserProfileTeamView() {
    Get.toNamed<void>(AppRoutes.distributorProfileView,);
  }

  static void goToSearchTeamView(String title) {
    Get.toNamed<void>(AppRoutes.searchTeam, arguments: title);
  }
}
