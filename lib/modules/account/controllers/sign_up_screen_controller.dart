import 'package:shoort/core/base_package.dart';

class SignUpScreenController extends BaseController{

  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
 RxBool isSignUp = false.obs;

  @override
  void onInit() {

    super.onInit();
  }



}