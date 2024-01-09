import 'package:shoort/core/base_package.dart';

class HelpCenterScreen extends BaseStatelessWidget {
   HelpCenterScreen({Key? key}) : super(key: key);


  List contactList = ["Customer Service",
  "WhatsApp",
  "Website",
  "Facebook",
  "Twitter",
  "Instagram",
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScreenContainer(
                height: 100.h,
        child: Column(children: [
          CustomAppBar(

            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(text: "Help Center", style: CustomTextTheme.normalPrimaryText(),onTap: (){} ),
            ),
            action: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.profileScreen);
                    },
                    child: Icon(Icons.person)),
              ),
            ],
          ),
          Expanded(child: CustomContainer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ShaderMask(
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
                    child: CustomContainer(
                      height: 5.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1)
                        )
                      ),
                      child: Center(child: CustomText(text: "FAQ", style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 15.sp,fontWeight: FontWeight.bold),onTap: (){},)),
                    )),
                ShaderMask(
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
                    child: CustomContainer(
                      height: 5.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1)
                        )
                      ),
                      child: Center(child: CustomText(text: "Contact Us", style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 15.sp,fontWeight: FontWeight.bold),onTap: (){},)),
                    )),

              ],),
              Expanded(
                child: Container(
                  child: PageView.builder(itemCount: 2,itemBuilder: (context,index){return
                  index==0?Container(

                    child: Column(
                      children: [
                        Row(
                          children: [
                          CustomContainer(
                            paddingLeft: 10.sp,
                            paddingTop: 10.sp,
                            child: RaisedGradientButton(
                              height: 4.5.h,
                              width: 30.w,
                              onPressed: () async{



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
                                Constants.general,
                                style: CustomTextTheme.normalPrimaryText(),
                              ),
                            ),
                          ),
                          CustomContainer(
                            paddingLeft: 10.sp,

                            paddingTop: 10.sp,
                            child: RaisedGradientButton(
                              height: 4.5.h,
                              width: 30.w,
                              onPressed: () async{



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
                                Constants.general,
                                style: CustomTextTheme.normalPrimaryText(),
                              ),
                            ),
                          ),


                        ],),
                      ],
                    ),

                  ):Container(

                    child: Column(
                      children: List.generate(5, (index) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: ListTile(

                            leading: ShaderMask(
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
                                child: Icon(Icons.video_collection_outlined,size: 25.sp,)),
                            title: CustomText(text: contactList[index],style: CustomTextTheme.normalPrimaryText(),onTap: (){},),

                          ),
                        );
                      })
                    ),

                  );}),
                ),
              )

            ],
          ),
          )),


        ],),


      ),
    );
  }
}
