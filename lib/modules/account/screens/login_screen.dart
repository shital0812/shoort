import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:shoort/core/base_package.dart';

import 'package:shoort/modules/account/controllers/authentication.dart';
import 'package:shoort/modules/account/controllers/login_screen_controller.dart';
import 'package:shoort/modules/home/screens/project_list_screen.dart';


class LoginScreen extends BaseStatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreenController loginScreenController =  LoginScreenController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  
      Scaffold(
        backgroundColor: Color(ColorsTheme.primaryBlack),
        appBar: CustomAppBar(
          paddingLeft: 04.sp,
          action: [

            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Icon(Icons.person, size: 32,),
            )
          ]
        ),
        body: customContainer(
          // height: 100.h,
          // width: 100.w,
          color: Color(ColorsTheme.primaryBlack),
          child:
          
           ListView(
            physics: const BouncingScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomContainer(
                paddingTop: 0.sp,
                  child: Text(
                    Constants.loginHeading,
                    style: CustomTextTheme.accountPrimaryText(),
                  )),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomContainer(
                      width: 35.w,

                      
                      child: CustomTextFiled(
                          icon: Icon(Icons.email_sharp,size: 6.sp, color: Color(ColorsTheme.secondaryWhite)),
                          isPassword: false,
                          isEmail: true,
                          hintText: Constants.emailBoxHintText,
                          textController: emailController,
                          hintTextStyle :CustomTextTheme.normal400Text()
                      ),
                    ),

                    CustomContainer(
                      width: 35.w,
                      child: CustomTextFiled(                        

                          icon: Icon(Icons.admin_panel_settings_sharp,size: 6.sp, color: Color(ColorsTheme.secondaryWhite)),
                          isPassword: true,
                          isEmail: false,
                          controller: loginScreenController,
                          hintText: Constants.passwordBoxHintText,
                          textController: passwordController,
                          hintTextStyle :CustomTextTheme.normal400Text()

                      ),
                    ),
                  ],
                ),
              ),

              ///Remember Widget
              /* CustomContainer(
                paddingTop: 25.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                    side: BorderSide(style: BorderStyle.solid,width: 3.0,color: Color(ColorsTheme.primaryColor), strokeAlign: 2),
                    value: false,
                        onChanged: (value){}),
                    Text(
                      Constants.rememberMe,
                      style: CustomTextTheme.normalPrimaryText(),
                    ),
                  ],
                ),
              ),*/


              CustomContainer(
                paddingTop: 10.sp,
                child: RaisedGradientButton(
                  height: 8.h,
                  width: 16.w,
                  onPressed: () async{

                    // Get.offAllNamed(AppRoutes.homeScreen);

                    Get.to(ProjectsListScreen());

                    // var value = _formKey.currentState!.validate();


                    // if(value){
                    //   loginScreenController.isSignIn.value = true;
                    //   await AuthenticationHelper().signIn(email: emailController.text, password: passwordController.text);
                    //   loginScreenController.isSignIn.value = false;

                    // }

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
                  child: loginScreenController.isSignIn.value==true? const CustomCircularProgressBar():Text(
                    Constants.signIn,
                    
                    style: CustomTextTheme.normalPrimaryText(),
                  ),
                ),
              ),
              CustomContainer(
                onTap: (){           

                       Get.toNamed(AppRoutes.forgotPassword);
                },
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(ColorsTheme.primaryColor),
                        Color(ColorsTheme.tertiaryColor),
                        Color(ColorsTheme.secondaryColor),
                      ]).createShader(
                    Rect.fromLTWH(0, 3, bounds.width, bounds.height),
                  ),
                  child: CustomText(
                    text: Constants.forgotPassword,
                    style: CustomTextTheme.normalPrimaryText(),
                    onTap: (){
                    },
                  ),
                ),
              ),
              CustomContainer(
                paddingBottom: 4.sp,
                paddingTop: 4.sp,
                child: Text(
                  Constants.orContinue,
                  style: CustomTextTheme.normalPrimaryText(),
                ),
              ),
              CustomContainer(
                paddingTop: 0.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // CustomWidgets.socialBox(
                    //     onTap: (){
                    //       var user = AuthenticationHelper().signInWithFacebook();
                    //       print("${user.toString()}");
                    //     },
                    //     height: 6.h,
                    //     width: 22.w,
                    //     image: Constants.fbIcon),
                    CustomWidgets.socialBox(
                        onTap: (){

                          AuthenticationHelper().SignInWithGoogle();
                          
                          // Get.toNamed(AppRoutes.videoEditingScreen);

                        },
                        height: 8.h,
                        width: 7.w,
                        image: Constants.googleIcon),
                   
              // CustomWidgets.socialBox(
              //           onTap: (){


              //           AuthenticationHelper().signInWithApple();
                  

              //           },

              //          height: 8.h,
              //           width: 10.w,
              //           image: Constants.appleIcon) 
              
                  ],
                ),
              ),
              CustomContainer(
                paddingTop: 4.sp,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: Constants.doNotHaveAccount,
                      style: CustomTextTheme.normalPrimaryText(),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                      text: Constants.signUp,
                      style: CustomTextTheme.normalPrimaryText()
                          .copyWith(color: Color(ColorsTheme.primaryColor)),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ));
    
  }
}
