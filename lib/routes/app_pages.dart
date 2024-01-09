import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/account/screens/edit_profile_screen.dart';
import 'package:shoort/modules/account/screens/forgot_password_screen.dart';
import 'package:shoort/modules/account/screens/help_center_screen.dart';
import 'package:shoort/modules/account/screens/login_screen.dart';
import 'package:shoort/modules/account/screens/profile_screen.dart';
import 'package:shoort/modules/account/screens/sign_up_screen.dart';
import 'package:shoort/modules/download/screens/download_video.dart';
import 'package:shoort/modules/home/screens/home_screen.dart';
import 'package:shoort/modules/home/screens/project_list_screen.dart';
import 'package:shoort/modules/onboarding/screens/splash_screen.dart';
import 'package:shoort/modules/projects/screens/project_creation_screen.dart';
import 'package:shoort/modules/subscription/checkout_screen.dart';
import 'package:shoort/modules/subscription/subscription_screen.dart';
import 'package:shoort/modules/transcripiton/screens/video_editing_screen.dart';
import 'package:shoort/routes/dependencies.dart';

import '../modules/transcripiton/screens/video_preview_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splashScreen,
      // page: () => LoginScreen(),
      page: () =>  SplashScreen(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () =>  ProfileScreen(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () =>  LoginScreen(),
      
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () =>   HomeScreen(),
      binding: HomeScreenBinding(),
    ),

    GetPage(
      name: AppRoutes.signUpScreen,
      page: () =>  SignUpScreen(),
      // binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.helpCenterScreen,
      page: () =>  HelpCenterScreen(),
      // binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () =>  ForgotPassword(),
      // binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.videoEditingScreen,
      page: () =>  VideoEditingScreen(),
      // binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () =>  EditProfileScreen(),
      binding: EditProfileScreenBinding(),
      transitionDuration: Duration(microseconds: 200)
    ),

    GetPage(
      name: AppRoutes.projectCreationScreen,
      page: () =>  ProjectCreationScreen(),
      binding: ProjectCreationScreenBinding(),
    ),


    GetPage(
      name: AppRoutes.projectsListScreen,
      page: () =>  ProjectsListScreen(),
    ),


    GetPage(
      name: AppRoutes.subscriptionScreen,
      page: () =>  SubscriptionScreen(),
    ),


    GetPage(
      name: AppRoutes.checkoutScreen,
      page: () =>  CheckoutScreen(),
    ),


    GetPage(
      name: AppRoutes.helpCenter,
      page: () =>  HelpCenterScreen(),
    ),

    GetPage(
      name: AppRoutes.videoPreviewScreen,
      page: () =>  const VideoPreviewScreen(),
    ),
    GetPage(
      name: AppRoutes.videoDownloadScreen,
      page: () =>  const DownloadVideo(),
    ),

  ];
}
