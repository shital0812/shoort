import 'package:shoort/core/base_package.dart';

class ProfileScreenController extends BaseController{


  RxString switchScreen = "EditProfile".obs;

  @override
  void onInit() {
    super.onInit();
  }

  String? validateText({text, altText}){
    return text??altText;
  }

}