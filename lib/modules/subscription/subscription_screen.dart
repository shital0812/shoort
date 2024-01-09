import 'package:shoort/core/base_package.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({Key? key}) : super(key: key);

  List premiumOffer = [
    "Sample Text",
    "Sample Text",
    "Sample Text",
    "Sample Text",
    "Sample Text"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  title: SvgPicture.asset(
                    "assets/icons/logo_white.svg",
                    fit: BoxFit.cover,
                    height: 90.sp,
                  ),
                  action: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.catching_pokemon),
                    ),
                  ],
                ),
                Container(
                  height: 85.h,
                  child: PageView(
                    pageSnapping: true,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(
                        3,
                        (index) => CustomContainer(
                              height: 85.h,
                              child: Center(
                                child: Container(
                                  height: 60.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: Color(ColorsTheme.primaryWhite),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(100.sp),
                                          bottomRight:
                                              Radius.circular(100.sp))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        onTap: () {},
                                        text: "Premium",
                                        style: CustomTextTheme
                                                .normalPrimaryText()
                                            .copyWith(
                                                color: Color(
                                                    ColorsTheme.secondaryColor),
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w100),
                                      ),
                                      CustomContainer(
                                        paddingTop: 0.0,
                                        transform: Matrix4.translationValues(
                                            20.sp, 0.0, 0.0),
                                        height: 5.h,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerRight,
                                                end: Alignment.centerLeft,
                                                colors: <Color>[
                                                  Color(
                                                      ColorsTheme.primaryColor),
                                                  Color(ColorsTheme
                                                      .tertiaryColor),
                                                  Color(ColorsTheme
                                                      .secondaryColor),
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                                child: CustomText(
                                              text: "SELECT",
                                              style: CustomTextTheme
                                                  .normalPrimaryText(),
                                              onTap: () {},
                                            )),
                                          ),
                                        ),
                                      ),
                                      CustomContainer(
                                        paddingTop: 0.0,
                                        transform: Matrix4.translationValues(
                                            21.sp, 0.0, 0.0),
                                        height: 3.h,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 7.w,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                stops: [0.0, 0.5, 0.0],
                                                colors: <Color>[
                                                  Color(
                                                      ColorsTheme.primaryColor),
                                                  Color(ColorsTheme
                                                      .tertiaryColor),
                                                  Color(
                                                      ColorsTheme.primaryBlack),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(
                                            premiumOffer.length,
                                            (index) => Container(
                                                  width: 50.w,
                                                  child: ListTile(
                                                      leading: Icon(
                                                        Icons.check,
                                                        color: Color(ColorsTheme
                                                            .primaryGreen),
                                                        size: 20.sp,
                                                      ),
                                                      title: Text(
                                                        premiumOffer[index],
                                                        style: CustomTextTheme
                                                                .normalPrimaryText()
                                                            .copyWith(
                                                                color: Color(
                                                                    ColorsTheme
                                                                        .primaryBlack),
                                                                fontSize:
                                                                    10.sp),
                                                      )),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: index ==
                                                                    premiumOffer.length -
                                                                        1
                                                                ? Colors
                                                                    .transparent
                                                                : Colors.grey,
                                                            width: index ==
                                                                    premiumOffer
                                                                            .length -
                                                                        1
                                                                ? 0.0
                                                                : 0.7)),
                                                  ),
                                                )),
                                      ),
                                      CustomContainer(
                                        paddingBottom: 0.0,
                                        transform: Matrix4.translationValues(
                                            -21.sp, 0.0, 0.0),
                                        height: 3.h,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 7.w,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                stops: [0.0, 0.5, 0.0],
                                                colors: <Color>[
                                                  Color(
                                                      ColorsTheme.primaryColor),
                                                  Color(ColorsTheme
                                                      .tertiaryColor),
                                                  Color(
                                                      ColorsTheme.primaryBlack),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.checkoutScreen);
                                        },
                                        child: CustomContainer(
                                          paddingTop: 0.0,
                                          transform: Matrix4.translationValues(
                                              -20.sp, 0.0, 0.0),
                                          height: 5.h,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerRight,
                                                  end: Alignment.centerLeft,
                                                  colors: <Color>[
                                                    Color(ColorsTheme
                                                        .primaryColor),
                                                    Color(ColorsTheme
                                                        .tertiaryColor),
                                                    Color(ColorsTheme
                                                        .secondaryColor),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                  child: CustomText(
                                                text: "SELECT",
                                                style: CustomTextTheme
                                                    .normalPrimaryText(),
                                                onTap: () {},
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
