import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/account/controllers/authentication.dart';
import 'package:shoort/modules/account/controllers/sign_up_screen_controller.dart';



class SignUpScreen extends BaseStatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  GlobalKey<FormState> _formSignUpKey = GlobalKey();

  SignUpScreenController _controller = Get.put(SignUpScreenController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return SafeArea(
          child: Scaffold(
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
              child: ListView(
                physics: BouncingScrollPhysics(),
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                      child: Text(
                    Constants.signUpHeading,
                    style: CustomTextTheme.accountPrimaryText(),
                  )),
                  Form(
                    key: _formSignUpKey,
                    child: Column(
                      children: [
                        CustomContainer(
                          paddingTop: 16.sp,

                          child: CustomTextFiled(
                              isUserName: true,
                              icon: Icon(Icons.person_rounded,
                                  size: 4.sp,
                                  color: Color(ColorsTheme.secondaryWhite)),
                              hintText: Constants.usernameBoxHint,
                              textController: userNameController,
                              hintTextStyle: CustomTextTheme.normal400Text()),
                        ),
                        CustomContainer(
                          child: CustomTextFiled(
                              isEmail: true,
                              icon: Icon(Icons.email_sharp,
                                  size: 4.sp,
                                  color: Color(ColorsTheme.secondaryWhite)),
                              hintText: Constants.emailBoxHintText,
                              textController: emailController,
                              hintTextStyle: CustomTextTheme.normal400Text()),
                        ),
                        CustomContainer(
                          child: CustomTextFiled(
                              icon: Icon(Icons.phone,
                                  size: 4.sp,
                                  color: Color(ColorsTheme.secondaryWhite)),
                              isPhone: true,
                              hintText: Constants.phoneBoxHint,
                              textController: phoneController,
                              hintTextStyle: CustomTextTheme.normal400Text()),
                        ),
                        CustomContainer(
                          child: CustomTextFiled(
                            controller: _controller,
                              icon: Icon(Icons.admin_panel_settings_sharp,
                                  size: 4.sp,
                                  color: Color(ColorsTheme.secondaryWhite)),
                              isPassword: true,
                              hintText: Constants.passwordBoxHintText,
                              textController: passwordController,
                              hintTextStyle: CustomTextTheme.normal400Text()),
                        ),
                        CustomContainer(
                          child: CustomTextFiled(
                            controller: _controller,
                              password: _controller.password.value.toString(),
                              icon: Icon(Icons.admin_panel_settings_sharp,
                                  size: 4.sp,
                                  color: Color(ColorsTheme.secondaryWhite)),
                              isConfirmPassword: true,
                              hintText: Constants.passwordConfirmBoxHintText,
                              textController: confirmPasswordController,
                              hintTextStyle: CustomTextTheme.normal400Text()),
                        ),
                      ],
                    ),
                  ),

                  ///Remember Me Widget
                  /*CustomContainer(
                    paddingTop: 25.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            side: BorderSide(
                                style: BorderStyle.solid,
                                width: 3.0,
                                color: Color(ColorsTheme.primaryColor),
                                strokeAlign: 2),
                            value: false,
                            onChanged: (value) {}),
                        Text(
                          Constants.rememberMe,
                          style: CustomTextTheme.normalPrimaryText(),
                        ),
                      ],
                    ),
                  ),*/

                  CustomContainer(


                    paddingTop: 12.sp,
                    paddingBottom: 20.sp,
                    child: RaisedGradientButton(
                      height: 08.h,
                      width: 30.w,
                      onPressed: () async {

                        var value = _formSignUpKey.currentState!.validate();
                        if (value) {

                          _controller.isSignUp.value  = true;
                          await AuthenticationHelper().signUp(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                        _controller.isSignUp.value  = false;


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
                      child: Text(
                        Constants.signUp,
                        style: CustomTextTheme.normalPrimaryText(),
                      ),
                    ),
                  ),
                  CustomContainer(
                    paddingTop: 4.sp,
                    child: Text(
                      Constants.orContinue,
                      style: CustomTextTheme.normalPrimaryText(),
                    ),
                  ),
                  CustomContainer(
                    paddingTop: 4.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        CustomWidgets.socialBox(
                            onTap: () {
                              AuthenticationHelper().SignInWithGoogle();
                            },
                            height: 8.h, width: 10.w, 
                            image: Constants.googleIcon),

                            CustomWidgets.socialBox(
                            height: 8.h, width: 10.w, 
                            
                            image: Constants.appleIcon),
                    
                      ],
                    ),
                  ),
                  CustomContainer(
                    paddingTop: 2.sp,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: Constants.alreadyHaveAccount,
                          style: CustomTextTheme.normalPrimaryText(),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAllNamed(AppRoutes.loginScreen);
                            },
                          text: Constants.signIn,
                          style: CustomTextTheme.normalPrimaryText()
                              .copyWith(color: Color(ColorsTheme.primaryColor)),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
