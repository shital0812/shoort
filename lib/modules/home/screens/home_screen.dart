import 'dart:io';
import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/modules/home/controllers/home_screen_controller.dart';

class HomeScreen extends BaseStatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    // var appUser = AppPrefrences.getAppUser();

   
    return Scaffold(

      // below drawer is for Profile ... 
      drawer: 
      
      SizedBox(
        
        width: 30.w,
        
        child:
         Drawer(
        backgroundColor: Color(ColorsTheme.primaryBlack),
       
        child: 
        
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:8.sp, vertical: 12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
          
            children: [
              
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/logo_white.svg'),
              radius: 100,
              ),
              SizedBox(height: 14.h,),
              
            GestureDetector(

              onTap: (){
              
                Get.toNamed(AppRoutes.profileScreen);
              },
              child: ListTile(leading: Icon(Icons.person, color: Color(ColorsTheme.primaryWhite),), title:  Text("Profile" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), )),
            
            Divider(
              height: 1,
              color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
            ),
            
            
            GestureDetector(
              
              onTap: (){
Get.toNamed(AppRoutes.projectsListScreen );

              },
              child: ListTile(leading: SvgPicture.asset("assets/icons/icon_history.svg", height: 20,width: 20,), title:  Text("Projects" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), )),
           
               Divider(
              height: 1,
              color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
            ),
              
            ListTile(leading: Icon(Icons.settings, color: Color(ColorsTheme.primaryWhite),), title:  Text("Notification Settings" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), ),
            
            
             Divider(
              height: 1,
              color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
            ),
            
            
            GestureDetector(
              
              onTap: (){
                


                showDialog(context: context, builder: (context){

  return  Stack(
    alignment: AlignmentDirectional.center,

    children: [

SvgPicture.asset("assets/icons/icon_transparentContainer.svg"),

Scaffold(
  
  backgroundColor: Colors.transparent,
  body: Center(child: 
  
  
  
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
children: [
SvgPicture.asset("assets/icons/icon_gmail.svg"),
SvgPicture.asset("assets/icons/icon_twitter.svg"),
SvgPicture.asset("assets/icons/icon_whatsapp.svg"),
SvgPicture.asset("assets/icons/icon_facebook.svg"),
SvgPicture.asset("assets/icons/icon_telegram.svg"),

],

      ),


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
                          child:   Center(child: Row(
                            children: [
                              Text("Http://www.appshoort.com/invit..",
                               style: TextStyle(color: Color(ColorsTheme.primaryBlack).withOpacity(0.5)),),
                            
                            SizedBox(
                              width: 5.w,
                              height: 4.h,
                              child: RaisedGradientButton(child: Text("Copy"), gradient: LinearGradient(
                                     begin: Alignment.topLeft,
                                     end: Alignment.bottomRight,
                                     colors: <Color>[
                                       Color(ColorsTheme.primaryColor),
                                       Color(ColorsTheme.tertiaryColor),
                                       Color(ColorsTheme.secondaryColor),
                                     ],
                                   ), onPressed: (){}),
                            )
                            
                            ],
                          )),
                        ),
                      ),
                    ), 
                   

    ],
  )
  
  )
  
  )


    ],
  );
});

              },
              child: ListTile(leading: Icon(Icons.favorite, color: Color(ColorsTheme.primaryWhite),), title:  Text("Share App" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), )),
              
          SizedBox(height: 13.h,),       
            ListTile(leading: SvgPicture.asset("assets/icons/icon_logout.svg",height: 20,width: 20,), title:  Text("Logout" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), ),
                 
            ],
            
            ),
          ),
        ),
      
      
        ),
      ) ,

     
      body:
      
       Builder(builder: 
       
       (BuildContext context){

        return Stack(
        alignment: Alignment.center,
            
        children: [
        
          // below container is the background image
          
          Container(
            // color: Colors.white,
            height: 100.h,
            width: 100.w,
            child: Image.asset("assets/icons/splash.png",
            fit: BoxFit.cover,         
            ),
            
          ),
          
          Positioned(
            top: 2.sp,
            right: 2.sp,
             
            child: GestureDetector(     
              onTap: (){
          Scaffold.of(context).openDrawer();
              },         
              
              child: Icon(Icons.person, color: Colors.white,size: 34,))),
        
        // below is the black color container with opacity
           Padding(
             padding: const EdgeInsets.all(40),
        
        
             child: Container(
            decoration: BoxDecoration(
               color: Color(ColorsTheme.primaryBlack).withOpacity(0.9),
               
            border: Border.all(),
               borderRadius: BorderRadius.circular(10)
        
            ),
             height: 100.h,
             width: 100.w,
        
        
        // below is the row for Dashboard and project library
             child: Padding(
               padding: const EdgeInsets.only(left:8.0),
        
               // below is the column for Dashboard, create new , recent ...
               child: Column(
                 
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // below is the text of Dashboard
             
                 CustomText(onTap: (){}, text: "DashBoard", style:CustomTextTheme.accountPrimaryText()),
        
                  // below is the text of Create new
        
                   Padding(
                     padding:  EdgeInsets.symmetric(vertical: 2.sp),
        
                     child: SizedBox(
                       width: 92.w,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(onTap: (){}, text: "CREATE NEW", style:CustomTextTheme.normalPrimaryText() ),
        
        
                           // below row is for notification icon and moon icon
                           SizedBox(
                             width: 40.w,
                             child: Row(
                              
                               children: [
                               CustomText(onTap: (){}, text: "Projects Library", style:CustomTextTheme.normalPrimaryText() ),
        
                               SizedBox(width: 15.w,),
                             Padding(
                               padding:  EdgeInsets.symmetric(horizontal:6.sp),
                               child: SvgPicture.asset("assets/icons/moon.svg",),
                             ),
        
                             
        
                             GestureDetector(
                              onTap:  (){
        
                                Get.toNamed(AppRoutes.profileScreen);
                              },
                               child: ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (Rect bounds) => RadialGradient(
                                            center: Alignment.topCenter,
                                            stops: [.5, 1],
                                            colors: [
                                                 Color(ColorsTheme.primaryColor),
                                
                                   Color(ColorsTheme.secondaryColor),
                                            ],
                                          ).createShader(bounds),
                                          child: Icon(Icons.notifications,size: 52,),
                             ),
                             ),
                                     
                             ],),
                           )
                     
                         ],
                       ),
                     ),
                   ),
             
             // below container is for upload video or record video 
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                     children: [
                       Container(
                         height: 40.h,
                         width: 50.w,
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
                           border: Border.all(),
                           borderRadius: BorderRadius.circular(5)
                         ),
        
                         child: Row(
                           children: [
                             //to do here
        
                           ],
                         ),
                         
                       ),
                   
                   // below is the searchbar and add team UI
                   Padding(
                     padding:  EdgeInsets.all(6.sp),
                     child: Container(
                      width: 37.w,
                      height: 8.h,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                       color: Colors.white.withOpacity(0.1),
                     ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
        
                    // below is the search box
        Padding(
        padding:  EdgeInsets.only(right: 2.sp),
        child:   Container(
          width: 12.w,
          height: 10.h,
        
          decoration: BoxDecoration(
            color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
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
          hintStyle: TextStyle(fontSize: 5.sp),
            
          
          suffixIcon: Icon(Icons.search, size: 38,)
        ),
        
         
            ),
          ),
        ),
        )
        ,
        
        // below is the list of team members 
        
        
        SizedBox(
        width: 12.w,
        
        child:   ListView.builder(
          
          // shrinkWrap: true,
          
            scrollDirection : Axis.horizontal,
            itemCount: 4,
        
          itemBuilder: 
        
        (context, index) {
        return (
         Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(100),
          color: index%2 == 0 ? Colors.red : Colors.blue
        ),
        child: Icon(Icons.person,size: 32,),
         )
        
        );
        
        },
        ),
        ),
        
        Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(100),
          color: Color(ColorsTheme.primaryBlack)
        ),
        child: Center(child: SvgPicture.asset("assets/icons/addteamIcon.svg",height: 32,width: 32,)),
         ),
         Padding(
           padding:  EdgeInsets.only(left:4.sp),
           child: SizedBox(
            width: 8.w,
            height: 10.h,
             child: RaisedGradientButton(child: CustomText(onTap: (){}, text: "Share", style: CustomTextTheme.normal400Text(size: 5.sp)), gradient: LinearGradient(
                                       begin: Alignment.topCenter,
                                       end: Alignment.bottomCenter,
                                       colors: <Color>[
                                         Color(ColorsTheme.primaryColor),
                                         Color(ColorsTheme.tertiaryColor),
                                         Color(ColorsTheme.secondaryColor),
                                       ],
                                     ), onPressed: (){}),
           ),
         )
        
                  
                  
                
                // below is to add team member in project 
        
        
         
                  
                     ],),
        
        
                     ),
                   )
                   
                ],
                   ),
        
                   // below row is for recent and see all text button
        
                   Padding(
                     padding:  EdgeInsets.symmetric(vertical:6.sp),
                     child: SizedBox(
                       width: 50.w,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                      CustomText(onTap: (){}, text: "Recent", style:CustomTextTheme.normalPrimaryText(size: 6.sp)),
                      
                     // below row is for seeall text and right arrow..
                       Row(
                         children: [
                           CustomText(onTap: (){}, text: "See All", style:CustomTextTheme.normalPrimaryText(size: 6.sp)),
                           Icon(Icons.arrow_forward_ios, color:Color(ColorsTheme.primaryWhite) ,)
                         ],
                       ),
                         ],
                       ),
                     ),
                   ),
        
        
                   // below List view is for the recent projects...
        
                   Expanded(
                     child: ListView.builder(
                       
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: 5,
                       itemBuilder: ((context, index){
                           return SizedBox(
                             height: 15.h,
                             width: 10.w,
                             child: Card(
                               
                           
                               color: Color(ColorsTheme.primaryWhite),
                             ),
                           );
                           
                     }
                     )
                        
                     
                     ),
                   )
                  
             
                   
             
             
             
             
               ],),
             ),
            
         ),
           ),
        
          
        ],
        
             
            );
   
       }
       
       )
   
    );

  }

  Future<void> createNewProject() async{
    try{

      File? file =await _controller.pickVideo();
      file==null? 
      
      {
        CustomSnackBar(
            errorHeading: Constants.fileSelectionFailed,
            e: Constants.fileSelectionFailedDetail),


      }
          :Get.toNamed(AppRoutes.projectCreationScreen, arguments: {'filePath': file?.path} );


    }catch (e){

      print(e.toString());

    }
  }



Future<File?> recordAndCreateNewProject() async{

try{

      File? file =await _controller.recordAndUploadVideo();
      file==null? 
      
      {
        CustomSnackBar(
            errorHeading: Constants.fileSelectionFailed,
            e: Constants.fileSelectionFailedDetail),


      }
          :Get.toNamed(AppRoutes.projectCreationScreen, arguments: {'filePath': file?.path} );


    }catch (e){

      print(e.toString());

    }

}

}

