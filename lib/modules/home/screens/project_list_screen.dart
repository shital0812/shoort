import 'dart:io';

import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/modules/home/controllers/home_screen_controller.dart';

class ProjectsListScreen extends BaseStatelessWidget {
   ProjectsListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // var appUser = AppPrefrences.getAppUser();
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            
            child: Image.asset("assets/icons/splash.png", fit: BoxFit.cover,),
          ),

Padding(
             padding:  EdgeInsets.all(8.sp),


             child: Container(

              decoration: BoxDecoration(
               color: Color(ColorsTheme.primaryBlack).withOpacity(0.9),
               
            border: Border.all(),
               borderRadius: BorderRadius.circular(10)

            ),
             height: 100.h,
             width: 100.w,
             

             child: Column(
               children: [
SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    CustomText(onTap: (){}, text: "All Projects", style: CustomTextTheme.accountPrimaryText()),

                    
SizedBox(width: 28.w,),
                   
                  
                    Container(

                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         gradient: LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   colors: <Color>[
                                     Color(ColorsTheme.primaryColor),
                                     Color(ColorsTheme.tertiaryColor),
                                     Color(ColorsTheme.secondaryColor),
                                   ],
                                 )

                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(1.75),
                        child: Container(
                          width: 20.w,
                          height: 5.h,
                        
                          decoration: BoxDecoration(
                            color: Color(ColorsTheme.primaryWhite),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child:   Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: TextEditingController(),
                              maxLines: 1,
                              
                              
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Search",
                                hintStyle: TextStyle(fontSize: 4.sp),
                            
                                
                                suffixIcon: Icon(Icons.search, size: 38,)
                              ),
                              
                               
                            ),
                          ),
                        ),
                      ),
                    ), 
                   
                   SizedBox(width: 1.w,),
                   Container(

                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         gradient: LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                   colors: <Color>[
                                     Color(ColorsTheme.primaryColor),
                                     Color(ColorsTheme.tertiaryColor),
                                     Color(ColorsTheme.secondaryColor),
                                   ],
                                 )

                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(1.75),
                        child: Container(
                          width: 18.w,
                          height: 5.h,
                        
                          decoration: BoxDecoration(
                            color: Color(ColorsTheme.primaryWhite),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child:   Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: 
                            Row(children: [

SvgPicture.asset("assets/icons/icon_folder.svg"),

CustomText(onTap: (){}, text: "New Folder", style: CustomTextTheme.normal400Text(size: 5.sp, color: Color(ColorsTheme.primaryBlack)) ,),



                            ],)
                            
                         
                          ),
                        ),
                      ),
                    ), 
                  SizedBox(width: 1.w,),
                  SvgPicture.asset("assets/icons/moon.svg" , height: 25,width: 25,),
                  SizedBox(width: 1.w,),
                  SvgPicture.asset("assets/icons/moon.svg" , height: 25,width: 25,),
                  
                  ],
                ),

                SizedBox(height: 4.h,),
                 Expanded(
                   child: Padding(
                     padding:  EdgeInsets.all(4.sp),
                     child: GridView.builder(
                                   
                                    
                      scrollDirection: Axis.vertical,
                                    
                      
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      mainAxisExtent: 200
                     
                     ), 
                     
                     itemCount: 16,
                     itemBuilder: ((context, index) {
                                    
                      return  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                    children: [
                                    
                                    Container(
                     width: 15.w,
                                    
                                    height: 16.h,
                                    decoration: BoxDecoration(
                     
                     borderRadius: BorderRadius.circular(10),
                     
                     color: Color(
                     ColorsTheme.primaryWhite).withOpacity(0.5)  ),
                                    
                                    ),
                                    
                                    SizedBox(width: 2.w,),
                                    
                                     Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                         text: "Project $index",
                         style: CustomTextTheme.normal400Text(size: 4.sp),
                         
                         onTap: (){} ,),
                                    
                                    
                                    SizedBox(height: 1.h,),
                             CustomText(
                         text: "DD/MM/YYYY  12:00 AM",
                         style: CustomTextTheme.normal400Text(size: 4.sp),
                         
                         onTap: (){} ,),
                      ],
                                     )
                                    ],
                                    
                      );
                     })),
                   ),
                 ),
               ],
             )),
             )
             
             
             
             



        ],
      )
      
      
      
      
     /*  
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
                  child: Icon(Icons.folder_special),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.profileScreen);
                      },
                      child: Icon(Icons.settings)),
                ),
              ],
            ),
            CustomContainer(
                width: 100.w,
                paddingTop: 20.sp,
                child: CustomListTileSecond(title: Constants.allProjects,isUpper: true)),

            appUser.projects.length==0?CustomContainer(
              height: 30.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomContainer(
                      paddingTop: 0.sp,
                      width: 60.w,child: Text(Constants.dontHaveProject.toUpperCase(),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 3,style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 12.sp,fontWeight: FontWeight.bold),)),
                  CustomContainer(
                    paddingTop: 30.sp,
                    child: RaisedGradientButton(
                      height: 5.h,
                      width: 27.w,
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
                        text:Constants.createNew,
                        textAlign: TextAlign.center,
                        style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 10.sp), onTap: (){},
                      ),
                    ),
                  ),


                ],
              ),
            ):ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: appUser.projects.length,


                itemBuilder: (context,index)=> CustomContainer(
                paddingTop: 0.sp,
                paddingBottom: 0.sp,
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       CustomContainer(
                         height:6.5.h,width: 25.w,color: Colors.white,),
                       CustomContainer(
                         paddingLeft: 5.sp,
                           width: 55.w,
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            CustomContainer(
                                paddingTop: 0.sp,

                                width: 60.w,child: Text(appUser.projects[index]["title"].toString(),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 1,style: CustomTextTheme.normalPrimaryText().copyWith(fontSize: 12.sp,fontWeight: FontWeight.normal),)),
                            CustomContainer(
                                paddingTop: 3.sp,
                                width: 60.w,child: Text("${(DateTime.parse(appUser.projects[index]['updated_at'].toString())).toString().substring(0,10)} ${(DateTime.parse(appUser.projects[index]['updated_at'].toString())).toString().substring(11,16)}  ${appUser.projects[index]['size'].toString()} Mb",textAlign: TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis
                              ,style: CustomTextTheme.normal400Text().copyWith(fontSize: 9.sp,color: Color(ColorsTheme.secondaryBlack).withOpacity(0.7)),)),
                          ],
                        ),
                      ),
                     ],
                    ),
                  ))),



          ],
        ),
      ),
     */
    
    
    );

  }


}


