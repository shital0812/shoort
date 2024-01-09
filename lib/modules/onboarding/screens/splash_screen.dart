import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/onboarding/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  SplashScreenController _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 100.h,
      width: 100.w,
      color: Color(ColorsTheme.primaryBlack),
      child: SvgPicture.asset("assets/icons/logo_white.svg"),
     );
  }
}
