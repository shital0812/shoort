import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/account/controllers/edit_profile_screen_controller.dart';
import 'package:shoort/modules/home/controllers/home_screen_controller.dart';
import 'package:shoort/modules/projects/controllers/project_creation_screen_controller.dart';

class EditProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileScreenController>(() => EditProfileScreenController());
  }
}


class ProjectCreationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectCreationScreenController>(() => ProjectCreationScreenController());
  }


}class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}