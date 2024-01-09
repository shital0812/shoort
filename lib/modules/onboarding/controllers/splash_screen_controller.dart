import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';

class SplashScreenController extends BaseController{

  @override
  void onInit() async {
  await Hive.initFlutter();
// GoogleSignIn _googleSignIn = GoogleSignIn();

 Get.toNamed(AppRoutes.loginScreen);

// // await _googleSignIn.disconnect();
// await FirebaseAuth.instance.signOut();
//     validate();

    super.onInit();
  }

  validate() {
    ///Navigate after 3 seconds
    if(FirebaseAuth.instance.currentUser!=null ) {
      Future.delayed(const Duration(seconds: 3)).then((value) =>
          Get.offAllNamed(AppRoutes.homeScreen));
    }
    else{
      Future.delayed(const Duration(seconds: 3)).then((value) =>
          Get.offAllNamed(AppRoutes.loginScreen));
    }

  }

}