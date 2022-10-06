part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class AppRoutes {
  static const login = _Paths.login;
  static const resetPassword = _Paths.resetPassword;
  static const confirmPassword = _Paths.confirmPassword;
  static const home = _Paths.home;
  static const search = _Paths.search;
  static const profile = _Paths.profile;
  static const editProfile = _Paths.editProfile;
  static const notification = _Paths.notification;
  static const onBoard = _Paths.onBoard;
  static const shopDetails = _Paths.shopDetails;
  static const kyc = _Paths.kyc;
  static const userProfile = _Paths.userProfile;
  static const materialRequest = _Paths.materialRequest;
  static const remarks = _Paths.remarks;
  static const regularization = _Paths.regularization;
  static const leaveRequest = _Paths.leaveRequest;
  static const teamView = _Paths.teamView;
  static const distributorProfileView = _Paths.distributorProfileView;
  static const moreInfo = _Paths.moreInfo;
  static const searchTeam = _Paths.searchTeam;
}

abstract class _Paths {
  static const login = '/login';
  static const resetPassword = '/reset_password';
  static const confirmPassword = '/confirm_password';
  static const home = '/home';
  static const search = '/search';
  static const profile = '/profile';
  static const editProfile = '/edit_profile';
  static const notification = '/notification';
  static const onBoard = '/on_board';
  static const shopDetails = '/shop_details';
  static const kyc = '/kyc';
  static const userProfile = '/user_profile';
  static const materialRequest = '/material_request';
  static const remarks = '/remarks';
  static const regularization = '/regularization';
  static const leaveRequest = '/leave_request';
  static const teamView = '/team_view';
  static const distributorProfileView = '/distributor_profile_view';
  static const moreInfo = '/more_info';
  static const searchTeam = '/search_team';

}
