import 'dart:io';
import 'package:animate_icons/animate_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/repository/api_repository.dart';
import 'package:shoort/core/repository/api_service.dart';
import 'package:shoort/modules/transcripiton/controllers/video_editing_screen_controller.dart';
import 'package:video_player/video_player.dart';

class VideoEditingScreen extends BaseStatelessWidget {
  VideoEditingScreen({Key? key}) : super(key: key);
  final projectId = Get.arguments["projectId"];
  final projectVideoUrl = Get.arguments["projectVideoUrl"];
  final VideoEditingScreenController _controller = Get.put(VideoEditingScreenController());


  AnimateIconController buttonIconController = AnimateIconController();


  @override
  Widget build(BuildContext context) {
    // _controller = Get.put(VideoEditingScreenController());

    // print("video url ${Constants.baseURL}$projectVideoUrl");

   _controller.setNewVideo("${Constants.baseURLVideoEditing}$projectVideoUrl");
    return Obx(() => WillPopScope(
      onWillPop: () async{
        Get.offAllNamed(AppRoutes.homeScreen);
        return false;
      },
      child: Scaffold(
            body: Stack(
              children: [
                CustomScreenContainer(
                  height: 100.h,
                  width: 100.w,
                  color: Color(ColorsTheme.primaryBlack),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                       
                        isBack: true,
                        title:
                        Container(
                          
                        ),
                  
                        action: [
                           const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(Icons.help, size: 32,)
                          ),

                          InkWell(
                            splashColor: Colors.transparent,
                           
                            highlightColor: Colors.transparent,
                            onTap: (){
                              Get.toNamed(AppRoutes.videoPreviewScreen);
                            },
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical:14.0),
                              child: Container(
                                width: 18.w,
                                decoration: BoxDecoration(
                                  
                            color: Color(ColorsTheme.primaryWhite)
                            
                                ),
                                child: Center(
                                  child: CustomText(
                                    onTap: (){},
                                    text: "Preview", 
                                    style: TextStyle(color:Color(ColorsTheme.primaryBlack) , fontFamily: 'Roboto', fontSize: 13.sp),
                                    
                                    ),
                                ),
                              ),
                            ),
                          )
                        ],
                      
                      
                      
                      ),
                      _controller.currentSelectedTool.value == 1

                          /// Subtitle Modification
                          ? SizedBox(
                              width: 90.w,
                              height: 70.h,
                              child: Text(
                                _controller.transcription.value.toString(),
                                style: CustomTextTheme.normalPrimaryText(),
                              ),
                              /*child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return CustomContainer(
                                      width: 90.w,
                                      height: 10.h,
                                      color: Colors.red,
                                    );
                                  }),*/
                            )
                          : _controller.currentSelectedTool.value == 2
                              ?

                              ///Subtitle Design
                              SizedBox(
                                  width: 90.w,
                                  height: 70.h,
                                  child: GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 2 / 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: 10,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                          ),
                                          child: const Text(
                                            "name",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        );
                                      }),
                                )

                              /// Video Viewer BOx
                              : Stack(
                                children: [
                                  CustomContainer(
                                      onTap: (){

                                        _controller.isPlayVisible.value = true;

                                        if(_controller.isPlayVisible.value==true){
                                          Future.delayed(const Duration(seconds: 2)).then((value) {
                                            _controller.isPlayVisible.value = false;
                                          });
                                        }


                                      },
                                      height: 60.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color(ColorsTheme.primaryColor),
                                            Color(ColorsTheme.tertiaryColor),
                                            Color(ColorsTheme.secondaryColor),
                                          ],
                                        ),
                                      ),
                                      child: FutureBuilder(
                                        future:
                                            _controller.initializeVideoPlayerFuture,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return AspectRatio(
                                              aspectRatio: _controller
                                                  .videoPlayerController
                                                  .value
                                                  .aspectRatio,
                                              child: VideoPlayer(
                                                  _controller.videoPlayerController),
                                            );
                                          } else {
                                            return const Center(
                                                child: CustomCircularProgressBar());
                                          }
                                        },
                                      ),
                                    ),
                                  CustomContainer(
                                    height: 60.h,
                                    width: 80.w,
                                    child: AnimateIcons(
                                      startIcon: Icons.play_arrow,
                                      endIcon: Icons.pause,
                                      size : 100.h * 0.15 - 100.w * 0.15,
                                      onStartIconPress: (){

                                        _controller.videoPlayerController.play();
                                        _controller.isPlaying.value = true;

                                        Future.delayed(const Duration(seconds: 2)).then((value) {
                                          _controller.isPlayVisible.value = false;
                                        });

                                        return true;},
                                      onEndIconPress: (){

                                        _controller.videoPlayerController.pause();
                                        _controller.isPlaying.value = false;




                                        return true;},
                                      duration: const Duration(milliseconds: 500),
                                      startIconColor: Color(ColorsTheme.tertiaryColor),
                                      endIconColor: _controller.isPlayVisible.value?Colors.white:Colors.transparent,
                                      clockwise: true,
                                      controller: buttonIconController,
                                    ),
                                  ),
                                ],
                              ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      CustomContainer(
                        paddingLeft: 0.sp,
                        paddingRight: 0.sp,
                        paddingBottom: 10.sp,
                        height: 8.h,
                        width: 100.w,
                        child: Row(
                          children: List.generate(
                              _controller.toolsIconList.length, (index) {
                            return _controller.currentSelectedTool.value == index
                                ? Container()
                                : GestureDetector(
                                    onTap: () async {
                                      _controller.currentSelectedTool.value =
                                          index;
                                      if (index == 1) {
                                        var transcription = await ApiService()
                                            .getProjectTranscription(
                                                projectId: 25);

                                        var transcriptionInLIst =
                                            await parseSRT(transcription!);

                                        print(transcriptionInLIst[1]);
                                        _controller.transcription.value =
                                            transcriptionInLIst.toString();
                                      }
                                    },
                                    child: CustomContainer(
                                      paddingTop: 0.sp,
                                      width: 33.33.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          _controller.toolsIconList[index],
                                          _controller.toolsTitleList[index]
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),
                      ),
                      CustomContainer(
                        paddingTop: 2.sp,
                        paddingLeft: 0.sp,
                        paddingRight: 0.sp,
                        paddingBottom: 4.sp,
                        color:
                            Color(ColorsTheme.secondaryBlack).withOpacity(0.05),
                        height: 8.h,
                        width: 100.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomContainer(
                              height: 3.h,
                              width: 12.w,
                              child: Center(
                                  child: _controller.toolsIconList[
                                      _controller.currentSelectedTool.value]),
                            ),
                            const Spacer(),
                            CustomText(
                              text: _controller
                                  .toolsTitleList[
                                      _controller.currentSelectedTool.value]
                                  .text
                                  .toString(),
                              onTap: () {},
                              style: CustomTextTheme.normalPrimaryBoldText()
                                  .copyWith(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}

Future<File?> pickVideo() async {
  final pickedFile = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.video, 
    //Only videos will be picked in the file picker
  );

  if (pickedFile == null) {
    return null;
  } else {
    final pickedVideo = pickedFile.files.first;
    return File(pickedVideo.path!);
  }
}

class Subtitle {
  final int startTime;
  final int endTime;
  final String text;

  Subtitle(this.startTime, this.endTime, this.text);

  @override
  String toString() {
    return 'Subtitle{startTime: $startTime, endTime: $endTime, text: $text}';
  }
}

Map<int, Subtitle> parseSRT(String srtData) {
  final subtitleMap = <int, Subtitle>{};

  // Split the SRT file into individual subtitle entries
  final entries = srtData.trim().split(RegExp(
      r'\r?\n(?!\r?\n)')); // add trim() to remove leading/trailing white space

  // Iterate through each entry and extract the start time, end time, and text
  for (var i = 0; i < entries.length; i += 3) {
    final index = int.tryParse(entries[i]);

    if (index == null) {
      continue;
    }

    // Extract the start and end time in milliseconds
    final times = entries[i + 1].split(' --> ');
    final startTime = parseSRTTime(times[0]);
    final endTime = parseSRTTime(times[1]);

    // Extract the subtitle text
    final text = entries[i + 2];

    subtitleMap[index] = Subtitle(startTime, endTime, text);
  }

  return subtitleMap;
}

int parseSRTTime(String time) {
  final parts = time.split(':');
  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  final secondsAndMillis = parts[2].split(',');
  final seconds = int.parse(secondsAndMillis[0]);
  final millis = int.parse(secondsAndMillis[1]);

  return (hours * 3600 + minutes * 60 + seconds) * 1000 + millis;
}
