import 'package:shoort/core/base_controller.dart';
import 'package:shoort/core/base_package.dart';
import 'package:subtitle/subtitle.dart';
import 'package:video_player/video_player.dart';

class VideoEditingScreenController extends BaseController{
  // late final videoUrl;
  // VideoEditingScreenController(this.videoUrl) {
  //   this.videoUrl = videoUrl;
  // }




  ///video player
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  RxBool isPlayVisible = true.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {

    final projectId = Get.arguments["projectId"];
  final projectVideoUrl = Get.arguments["projectVideoUrl"];
    // videoPlayerController =  VideoPlayerController.network(
    //     "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4",
    // );
    //
    videoPlayerController =  VideoPlayerController.networkUrl(Uri.parse("https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"));
    initializeVideoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    // initilizeVideoController(videoUrl: "https://www.youtube.com/watch?v=drZOzprfSSQ");
    super.onInit();
  }

  void setNewVideo(String videoUrl) {


    try{
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        debugPrint("test");
        update();
      });
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  Future initilizeVideoController({required String videoUrl}) async{
    videoPlayerController = await VideoPlayerController.networkUrl(
      Uri.parse(videoUrl.toString()),
    );
    initializeVideoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }



  List toolsIconList = [
    Icon(Icons.auto_awesome, color: Color(ColorsTheme.primaryWhite)),
    Icon(Icons.subtitles, color: Color(ColorsTheme.primaryWhite)),
    Icon(Icons.edit, color: Color(ColorsTheme.primaryWhite)),
    Icon(Icons.insert_emoticon_sharp, color: Color(ColorsTheme.primaryWhite)),

  ];

  List toolsTitleList = [
    CustomText(onTap: (){},maxLine: 2, textAlign: TextAlign.center,text: Constants.automaticSubtitleGeneration, style:  CustomTextTheme.normalPrimaryText().copyWith(fontSize: 8.sp,color: Color(ColorsTheme.secondaryBlack))),
    CustomText(onTap: (){},maxLine: 2, textAlign: TextAlign.center,text: Constants.subtitleModification, style:  CustomTextTheme.normalPrimaryText().copyWith(fontSize: 8.sp,color: Color(ColorsTheme.secondaryBlack))),
    CustomText(onTap: (){}, maxLine: 2,textAlign: TextAlign.center,text: Constants.subtitleDesign, style:  CustomTextTheme.normalPrimaryText().copyWith(fontSize: 8.sp,color: Color(ColorsTheme.secondaryBlack))),
    CustomText(onTap: (){}, maxLine: 2,textAlign: TextAlign.center,text: Constants.emoji, style:  CustomTextTheme.normalPrimaryText().copyWith(fontSize: 8.sp,color: Color(ColorsTheme.secondaryBlack))),
  ];

  RxInt currentSelectedTool = 0.obs;

  RxString transcription = ''.obs;

  @override
  void dispose() {
    
    videoPlayerController.dispose();

    super.dispose();
  }


}

