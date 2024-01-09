import 'package:shoort/core/base_package.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);

   TextEditingController couponCodeTextController = TextEditingController();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreenContainer(
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              height: 20.h,
              width: 85.w,
              child: SvgPicture.asset(
                "assets/icons/logo_white.svg",
                fit: BoxFit.fitWidth,
              ),
            ),
            CustomContainer(
              paddingTop: 0.0,
              height: 25.h,
              width: 90.w,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color(ColorsTheme.primaryWhite)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CustomText(onTap: (){},text: "Subtotal", style: CustomTextTheme.normalPrimaryText()),
                        Spacer(),
                        CustomText(onTap: (){},text: "\$499.00", style: CustomTextTheme.normalPrimaryText().copyWith(color: Color(ColorsTheme.secondaryColor))),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(onTap: (){},text: "Subtotal", style: CustomTextTheme.normalPrimaryText()),
                        Spacer(),
                        CustomText(onTap: (){},text: "\$499.00", style: CustomTextTheme.normalPrimaryText().copyWith(color: Color(ColorsTheme.secondaryColor))),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(onTap: (){},text: "Subtotal", style: CustomTextTheme.normalPrimaryText()),
                        Spacer(),
                        CustomText(onTap: (){},text: "\$499.00", style: CustomTextTheme.normalPrimaryText().copyWith(color: Color(ColorsTheme.secondaryColor))),
                      ],
                    ),
                    Row(
                      children: [
                        CustomContainer(paddingTop: 0.sp,paddingBottom:0.sp,child: CustomCouponTextFiled(hintText: "Coupon Code", textController: couponCodeTextController, hintTextStyle: CustomTextTheme.normalPrimaryText())),
                        Spacer(),
                        CustomContainer(
                          paddingTop: 0.sp,
                          paddingBottom: 0.sp,
                          child: RaisedGradientButton(
                            height: 6.h,
                            width: 35.w,
                            onPressed: () async {
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
                              text:Constants.applyCoupon,
                              textAlign: TextAlign.center,
                              style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 10.sp), onTap: (){},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomContainer(
              paddingLeft: 20.0,
              paddingRight: 20.0,
              height: 12.h,
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(ColorsTheme.primaryWhite)),
                    bottom: BorderSide(width: 1, color: Color(ColorsTheme.primaryWhite)),
                  ),

            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                    paddingTop: 0.sp,
                    paddingBottom: 0.sp,
                    child: RaisedGradientButton(
                      height: 6.h,
                      width: 70.w,
                      onPressed: () async {
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
                        text: "Checkout | \$547.00",
                        textAlign: TextAlign.center,
                        style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600), onTap: (){},
                      ),
                    ),
                  ),

                ],
              ),
            ),
            CustomContainer(width: 100.w,
              paddingLeft: 20.0,
              paddingRight: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    paddingTop: 0.sp,
                    paddingBottom: 0.sp,
                    child: CustomText(
                      text: Constants.securePayments.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 8.5.sp, fontWeight: FontWeight.normal,color: Color(ColorsTheme.secondaryWhite)), onTap: (){},
                    ),
                  ),

                ],
              ),
            ),
            CustomContainer(width: 100.w,
              paddingLeft: 20.0,
              paddingRight: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidgets.socialBox(
                  onTap: (){


              },
                      height: 4.h,
                      width: 15.w,
                      image: Constants.googleIcon,
                    color: Color(ColorsTheme.primaryWhite),
                    radius: 10.0
                  ),
                  CustomWidgets.socialBox(
                  onTap: (){


              },
                      height: 4.h,
                      width: 15.w,
                      image: Constants.googleIcon,
                    color: Color(ColorsTheme.primaryWhite),
                    radius: 10.0
                  ),
                  CustomWidgets.socialBox(
                  onTap: (){


              },
                      height: 4.h,
                      width: 15.w,
                      image: Constants.googleIcon,
                    color: Color(ColorsTheme.primaryWhite),
                    radius: 10.0
                  ),
                  CustomWidgets.socialBox(
                  onTap: (){


              },
                      height: 4.h,
                      width: 15.w,
                      image: Constants.googleIcon,
                    color: Color(ColorsTheme.primaryWhite),
                    radius: 10.0
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
