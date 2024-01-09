import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/core/prefrences/appuser.dart';
import 'package:shoort/core/repository/api_repository.dart';
import 'package:shoort/core/repository/api_service.dart';
import 'package:shoort/modules/account/controllers/authentication.dart';
import 'package:shoort/modules/account/controllers/edit_profile_screen_controller.dart';
import 'package:shoort/modules/account/controllers/sign_up_screen_controller.dart';
import 'package:shoort/modules/account/models/app_user_profile.dart';

class EditProfileScreen extends BaseStatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  GlobalKey<FormState> _formSignUpKey = GlobalKey();
  EditProfileScreenController _controller = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {

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
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                  child: Text(
                    Constants.editProfileHeading,
                    style: CustomTextTheme.accountPrimaryText(),
                  )),
              CustomContainer(
                paddingTop: 25.sp,
                child:
                Stack(
                  children: [
                    CustomContainer(
                      child:
                      CustomContainer(
                        height: 100.sp,
                        width: 100.sp,
                        decoration: BoxDecoration(
                          color: Color(ColorsTheme.primaryWhite),
                          shape: BoxShape.circle,
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.sp),
                          ),

                          child: _controller.profileImagePath.value.length!=0?Image.file(File(_controller.profileImagePath.value), fit: BoxFit.cover):CachedNetworkImage(
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                            imageUrl:
                            "${Constants.baseURL}${AppPrefrences.getAppUser().profileImage.toString()}",
                          ),
                        ),),
                    ),


                    Positioned(
                      bottom: 0,
                      right: 100.sp,

                      child: CircleAvatar(backgroundColor: Color(ColorsTheme.primaryColor), radius: 12.sp,
                        child: ImagePickerWidget(onTap: (){
                          _controller.pickImage(ImageSource.gallery);
                        },),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formSignUpKey,
                child: Column(
                  children: [
                    CustomContainer(
                      paddingTop: 35.sp,

                      child: CustomTextFiled(
                          isEmpty: true,
                          isUserName: true,
                          icon: Icon(Icons.person_rounded,
                              size: 25.sp,
                              color: Color(ColorsTheme.secondaryWhite)),
                          hintText: AppPrefrences.getAppUser().name.toString(),
                          textController: userNameController,
                          hintTextStyle: CustomTextTheme.normal400Text()),
                    ),

                    CustomContainer(
                      child: CustomTextFiled(
                          isEmpty: true,
                          icon: Icon(Icons.phone,
                              size: 25.sp,
                              color: Color(ColorsTheme.secondaryWhite)),
                          isPhone: true,
                          hintText: AppPrefrences.getAppUser().phone.toString(),
                          textController: phoneController,
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

                    var value = _formSignUpKey.currentState!.validate();

                    if (value) {

                      _controller.saveLoadingStart.value = true;
                      if(_controller.profileImagePath.value.length!=0){
                        await APIRepository().uploadFile(url: Constants.updateUserData, filePath: _controller.profileImagePath.value, fileKey: 'profile_image');
                      }
                      await ApiService().updateUserProfile(appUserProfile: AppUserProfile(name: userNameController.text.isEmpty?null:userNameController.text,phone: phoneController.text.isEmpty?null:phoneController.text, profileImage: _controller.profileImagePath.value.length>2?_controller.profileImagePath.value:null));
                      await ApiService.getProfileData();
                      _controller.saveLoadingStart.value = false;
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
                  child: _controller.saveLoadingStart.value==true?CustomCircularProgressBar():Text(
                    Constants.save,
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
