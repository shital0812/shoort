import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoort/core/base_package.dart';

class ProjectCreationScreenController extends BaseController {

  RxString selectedVideoPath = ''.obs;
  RxString projectName = ''.obs;
  RxBool isProjectName = false.obs;
  RxBool isProjectCreating = false.obs;


  @override
  void onInit() {

    selectedVideoPath.value = Get.arguments['filePath'].toString();
    super.onInit();
    
  }

  @override
  void dispose() {
    Get.delete<ProjectCreationScreenController>();
    super.dispose();
  }



}
