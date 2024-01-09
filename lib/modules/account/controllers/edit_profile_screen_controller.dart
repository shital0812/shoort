import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoort/core/base_package.dart';

class EditProfileScreenController extends BaseController {
  RxString profileImagePath = ''.obs;
  RxBool saveLoadingStart = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );

      if (pickedFile != null) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: "Set Your Image",
                activeControlsWidgetColor: Color(ColorsTheme.primaryColor),
                toolbarColor: Color(ColorsTheme.primaryBlack),
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Cropper',
            ),
          ],
        );
        if (croppedFile != null) {
          profileImagePath.value = croppedFile.path.toString();
        }
      }else{
        CustomSnackBar(errorHeading: Constants.profileSelectionFailed, e: Constants.profileSelectionFailedDetails);
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

}
