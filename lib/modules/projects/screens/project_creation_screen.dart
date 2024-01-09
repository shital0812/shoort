import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/core/repository/api_repository.dart';
import 'package:shoort/core/repository/api_service.dart';
import 'package:shoort/modules/projects/controllers/project_creation_screen_controller.dart';

class ProjectCreationScreen extends BaseStatelessWidget {
  ProjectCreationScreen({Key? key}) : super(key: key);


  TextEditingController projectNameController = new TextEditingController();
  GlobalKey<FormState> _formSignUpKeyProjectCreation = GlobalKey();
  ProjectCreationScreenController _controller = Get.find<ProjectCreationScreenController>();
  final videoInfo = FlutterVideoInfo();


  @override
  Widget build(BuildContext context) {

    var appUser = AppPrefrences.getAppUser();


    final Map arguments = Get.arguments;
    _controller.selectedVideoPath.value = arguments['filePath'].toString();

    return SafeArea(
      child: Obx(()=>Scaffold(
        backgroundColor: Color(ColorsTheme.primaryBlack),
        appBar: CustomAppBar(),
        body: customContainer(
          height: 100.h,
          width: 100.w,
          color: Color(ColorsTheme.primaryBlack),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CustomContainer(
                  child: Text(
                    Constants.createProject,
                    textAlign: TextAlign.left,
                    style: CustomTextTheme.accountPrimaryText(),
                  )),
              CustomContainer(
                width: 100.w,
                child: Row(
                  children: [
                    CustomContainer(
                      height: 20.h,
                      width: 30.w,
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),

                    ),
                    Spacer(),
                    CustomContainer(
                      height: 20.h,
                      width: 55.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarqueeText(
                              text: "${_controller.selectedVideoPath.value}     ",
                              textStyle: CustomTextTheme.normalSemiText()
                                  .copyWith(fontSize: 10.sp)),
                          FutureBuilder(
                            future: videoInfo.getVideoInfo(_controller.selectedVideoPath.value),
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.done){

                                if (snapshot.hasData) {
                                  _controller.projectName.value = "Project ${snapshot.data!.title.toString()}";

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Size : ${(snapshot.data!.filesize!/(1024 * 1024)).toStringAsFixed(2)} Mb",
                                          style: CustomTextTheme.normalSemiText()
                                              .copyWith(fontSize: 10.sp)),
                                      SizedBox(height: 3.sp,),

                                      Text("Duration : ${(_controller.getDuration(Duration(milliseconds: snapshot.data!.duration!.toInt())))} Min.",
                                          style: CustomTextTheme.normalSemiText()
                                              .copyWith(fontSize: 10.sp)),
                                      SizedBox(height: 3.sp,),

                                      Text("Orientation : ${snapshot.data!.height}/${snapshot.data!.width}",
                                          style: CustomTextTheme.normalSemiText()
                                              .copyWith(fontSize: 10.sp)),
                                      SizedBox(height: 3.sp,),

                                      Text("Title : ${snapshot.data!.title}",
                                        style: CustomTextTheme.normalSemiText()
                                            .copyWith(fontSize: 10.sp),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    ],
                                  );

                                }else{
                                  return CircularProgressIndicator();
                                }
                              }else{
                                return CircularProgressIndicator();
                              }
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomContainer(
                paddingTop: 20.sp,
              ),
              Form(
                key: _formSignUpKeyProjectCreation,
                child: Column(
                  children: [
                    CustomContainer(
                      paddingTop: 35.sp,
                      child: CustomTextFiled(
                          isEmpty: true,
                          isUserName: true,
                          icon: Icon(Icons.padding_outlined,
                              size: 25.sp,
                              color: Color(ColorsTheme.secondaryWhite)),
                          // hintText: _controller.projectName.value,
                          hintText: _controller.isProjectName.value==true?_controller.projectName.value:"Project Name",
                          textController: projectNameController,
                          hintTextStyle: CustomTextTheme.normal400Text()),
                    ),
                  ],
                ),
              ),
              CustomContainer(
                paddingTop: 30.sp,
                child: RaisedGradientButton(
                  height: 6.h,
                  width: 80.w,
                  onPressed: () async {
                    var value = _formSignUpKeyProjectCreation.currentState!.validate();
                    if (value) {

                      if(!projectNameController.text.isEmpty){
                        _controller.projectName.value = projectNameController.text;
                      }

                      _controller.isProjectCreating.value=true;
                      await APIRepository().uploadVideoFile(url: Constants.projectsList, filePath: _controller.selectedVideoPath.value, fileKey: 'video', title: _controller.projectName.value.toString());
                      await ApiService.getProfileData();
                      _controller.isProjectCreating.value=false;
                      var appUser = AppPrefrences.getAppUser();
                      Get.offAllNamed(AppRoutes.videoEditingScreen, arguments: {'projectId' : appUser.projects[appUser.projects.length-1]["id"], 'projectVideoUrl' : appUser.projects[appUser.projects.length-1]["video"]});

                    }
                  },
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(ColorsTheme.primaryColor),
                      Color(ColorsTheme.tertiaryColor),
                      Color(ColorsTheme.secondaryColor),
                    ],
                  ),
                  child: _controller.isProjectCreating.value==true?CustomCircularProgressBar():Text(
                    Constants.create,
                    style: CustomTextTheme.normalPrimaryText(),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
