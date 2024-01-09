import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

class BaseController extends GetxController{


  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  Future<File?> pickVideo() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.video, //Only videos will be picked in the file picker
    );

    if (pickedFile == null) {
      return null;
    } else {
      final pickedVideo = pickedFile.files.first;
      return File(pickedVideo.path!);
    }
  }



Future<File?> recordAndUploadVideo() async{

  final XFile? video = await ImagePicker().pickVideo(source: ImageSource.camera);

    if (video == null) {
      return null;
    } else {
      // final pickedVideo = video.path;
      return File(video.path);
    }

}





  String getDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0)
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    else
      return "$twoDigitMinutes:$twoDigitSeconds";
  }

  double millisecondsToMinutes(int milliseconds) {
    return milliseconds / 60000;
  }

}