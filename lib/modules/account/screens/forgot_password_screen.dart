import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/account/controllers/authentication.dart';

class ForgotPassword extends BaseStatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  TextEditingController forgotPasswordController = new TextEditingController();

  GlobalKey<FormState> _formForgotKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(ColorsTheme.primaryBlack),
        appBar: CustomAppBar(),
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
                Constants.forgotPassHeading,
                style: CustomTextTheme.accountPrimaryText(),
              )),
              Form(
                key: _formForgotKey,
                child: Column(
                  children: [
                    CustomContainer(
                      paddingTop: 25.sp,
                      child: CustomText(
                      onTap : (){},
                        textAlign: TextAlign.center,
                        text : Constants.passwordResetNote,
                        style: CustomTextTheme.normalPrimaryText(),
                      ),
                    ),

                    CustomContainer(
                      child: CustomTextFiled(
                          isEmail: true,
                          icon: Icon(Icons.email_sharp,
                              size: 12.sp,
                              color: Color(ColorsTheme.secondaryWhite)),
                          hintText: Constants.emailBoxHintText,
                          textController: forgotPasswordController,
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
                paddingTop: 20.sp,
                child: RaisedGradientButton(
                  height: 08.h,
                  width: 30.w,
                  onPressed: () async {
                    var value = _formForgotKey.currentState!.validate();
                    if (value) {
                      AuthenticationHelper().resetPassword(
                          email: forgotPasswordController.text);
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
                  child: CustomText(
                    text: Constants.send,
                    style: CustomTextTheme.normalPrimaryText(), onTap: (){},
                  ),
                ),
              ),
              // CustomContainer(
              //   paddingTop: 30.sp,
              //   child: Text(
              //     Constants.orContinue,
              //     style: CustomTextTheme.normalPrimaryText(),
              //   ),
              // ),
              // CustomContainer(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CustomWidgets.socialBox(
              //           height: 6.h, width: 22.w, image: Constants.fbIcon),
              //       CustomWidgets.socialBox(
              //           onTap: () {
              //             AuthenticationHelper.SignInWithGoogle();
              //           },
              //           height: 6.h,
              //           width: 22.w,
              //           image: Constants.googleIcon),
              //       CustomWidgets.socialBox(
              //           height: 6.h, width: 22.w, image: Constants.appleIcon),
              //     ],
              //   ),
              // ),
              CustomContainer(
                paddingTop: 4.sp,
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
}
