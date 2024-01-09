import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/core/repository/api_service.dart';
import 'package:shoort/modules/account/controllers/authentication.dart';
import 'package:shoort/modules/account/controllers/profile_screen_controller.dart';

class ProfileScreen extends BaseStatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

   final ProfileScreenController _controller = Get.put(ProfileScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsTheme.primaryBlack),
      body: Obx( () {
          return SingleChildScrollView(
            child: Row(
              children: [

// below is the left view
Container(
height: 100.h,
color: Colors.white.withOpacity(0.2),

width: 30.w,

child: SingleChildScrollView(
  child:   Padding(
                padding:  EdgeInsets.symmetric(horizontal:16.sp, vertical: 6.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
Padding(
  padding:  EdgeInsets.only(bottom:6.sp),
  
  child:   GradientText("User Profile", gradient: 
  
  LinearGradient(
                                             begin: Alignment.topLeft,
                                           end: Alignment.bottomRight,
                                             colors: <Color>[
                                               Color(ColorsTheme.primaryColor),
                                               Color(ColorsTheme.tertiaryColor),
                                               Color(ColorsTheme.secondaryColor),
                                             ],
   
          ),
  
          style: CustomTextTheme.normal400Text(size: 6.sp),
          
          
          
          ),
),
  
                const CircleAvatar(
    backgroundImage: AssetImage('assets/icons/logo_white.svg'),
    radius: 100,
  ),

  Padding(
    padding:  EdgeInsets.symmetric(vertical:2.sp),
    child: CustomText(onTap: (){}, text: "First Name", style: CustomTextTheme.normalSemiText(size: 8.sp)),
  ),
  CustomText(onTap: (){}, text: "Email@Example.com", style: CustomTextTheme.normal400Text(size: 3.sp)),
  SizedBox(height: 10.h,),
  
                GestureDetector(
                  onTap: (){
  _controller.switchScreen.value = "EditProfile";
                    
                  },
                  child: ListTile(leading: Icon(Icons.person, color: _controller.switchScreen.value == "EditProfile" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5),
                  
                  
                  
                  ), title:  Text("Edit Profile" , style: TextStyle(color: _controller.switchScreen.value == "EditProfile" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5)),), )),
                
                Divider(
                  height: 1,
                  color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
                ),
                GestureDetector(
                  
                  onTap: (){
_controller.switchScreen.value = "Plan";

                  },
                  
                  child: ListTile(leading: SvgPicture.asset("assets/icons/icon_plan.svg", height: 20,width: 20,
                  
                  color: _controller.switchScreen.value == "Plan" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5),
                  ), title:  Text("Plan" , style: TextStyle(color: _controller.switchScreen.value == "Plan" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5)),), )),
               
                 Divider(
                  height: 1,
                  color: Color(ColorsTheme.primaryWhite).withOpacity(0.2),
                ),
  
                GestureDetector(
                  onTap: (){
_controller.switchScreen.value = "Billing"; 

                  },
                  child: ListTile(leading: SvgPicture.asset("assets/icons/icon_billing.svg",height: 20,width: 20,
                  
                  color: _controller.switchScreen.value == "Billing" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5),
                  
                  ), title:  Text("Billing" , style: TextStyle(color: _controller.switchScreen.value == "Billing" ?  Colors.white:Color(ColorsTheme.primaryWhite).withOpacity(0.5)),), )),
                
                
              SizedBox(height: 13.h,),   

                ListTile(leading: SvgPicture.asset("assets/icons/icon_logout.svg",height: 20,width: 20,), title:  Text("Logout" , style: TextStyle(color: Color(ColorsTheme.primaryWhite)),), ),
                     
                ],
                
                ),
              ),
),





),

// divider gradient 

SizedBox(
  width: 4,
  height: 100.h,
  child: Container(
    decoration: BoxDecoration(
          gradient: LinearGradient(
                                         begin: Alignment.topLeft,
                                           end: Alignment.bottomRight,
                                           colors: <Color>[
                                             Color(ColorsTheme.primaryColor),
                                             Color(ColorsTheme.tertiaryColor),
                                             Color(ColorsTheme.secondaryColor),
                                           ],
 
    ),
    )
  ),
),


// below is the right side profile page
_controller.switchScreen.value == "EditProfile" ? EditProfile():
_controller.switchScreen.value == "Plan" ? Plan() : SizedBox()




              ],
            ),
          );
        }
      ),
    );
  }
}

// below widget is for edit profile ...



class EditProfile extends StatelessWidget {

  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 69.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
             const CircleAvatar(
        backgroundImage: AssetImage('assets/icons/logo_white.svg'),
        radius: 100,
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                  width: 18.w,
                  child: CustomTextFiled(
                    textFieldWidth: 12,

                    
                    hintText: 'First Name', textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),

                SizedBox(width: 2.w,),

                CustomContainer(
                  width: 20.w,
                  child: CustomTextFiled(
                    textFieldWidth: 14,
                    
                    hintText: 'Last Name', textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),
               
              ],
            ),

             CustomContainer(
              paddingTop: 0,
                  paddingBottom: 0,
                  width: 50.w,
                  child: CustomTextFiled(
                    textFieldWidth: 35,
                    
                    hintText: "Bio... Tell something about yourself...",
 textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),
                 CustomContainer(
                  paddingTop: 0,
                  paddingBottom: 0,
                  width: 50.w,
                  child: CustomTextFiled(
                    textFieldWidth: 35,
                    
                    hintText: "example@website.com", textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),
                 CustomContainer(
                  paddingTop: 0,
                  paddingBottom: 0,
                  width: 50.w,
                  child: CustomTextFiled(
                    textFieldWidth: 35,
                    
                    hintText: "(319) 555-0115", textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),
                 CustomContainer(
                  paddingTop:0 ,
                  paddingBottom: 0,
                  width: 50.w,
                  child: CustomTextFiled(
                    textFieldWidth: 35,
                    
                    hintText: "3891 Ranchview Dr. Richardson, California 62639", textController: TextEditingController(), icon: const Icon(Icons.person), hintTextStyle: const TextStyle(), 
                  
                  ),
                ),

                SizedBox(height: 8.h,),

            RaisedGradientButton(
            
              
              width: 16.w,
              height: 7.h,
              child:CustomText(onTap: (){}, text: "Save Changes", style: CustomTextTheme.normalSemiText(size: 5.sp)), gradient:  LinearGradient(
                                       begin: Alignment.topLeft,
                                       end: Alignment.bottomRight,
                                       colors: <Color>[
                                         Color(ColorsTheme.primaryColor),
                                         Color(ColorsTheme.tertiaryColor),
                                         Color(ColorsTheme.secondaryColor),
                                       ],
 
    ), onPressed: (){
/// save changes

    })
          ],
        ),
      ),
    );
  }
}




class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
      SizedBox(
        width: 69.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomContainer(
              width: 20.w,
              height: 10.sp,
      
              child: RaisedGradientButton(gradient:  LinearGradient(
                                                     begin: Alignment.topLeft,
                                                   end: Alignment.bottomRight,
                                                     colors: <Color>[
                                                       Color(ColorsTheme.primaryColor),
                                                       Color(ColorsTheme.tertiaryColor),
                                                       Color(ColorsTheme.secondaryColor),
                                                     ],
                 
                  ),
                 onPressed: (){}, 
                 
                 child:
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                SvgPicture.asset("assets/icons/icon_editBill.svg", height: 25,width: 25,),
                SizedBox(width: 2.sp,),
                
                CustomText(onTap: (){}, text: "Edit Billing Information", style: CustomTextTheme.normal400Text(size: 4.sp))
                ],)),
            ),
         
             CustomContainer(
              width: 20.w,
              height: 10.sp,
      
              child: RaisedGradientButton(
                
                gradient:  LinearGradient(
                                                     begin: Alignment.topLeft,
                                                   end: Alignment.bottomRight,
                                                     colors: <Color>[
                                                       Color(ColorsTheme.primaryColor),
                                                       Color(ColorsTheme.tertiaryColor),
                                                       Color(ColorsTheme.secondaryColor),
                                                     ],
                 
                  ),
                 onPressed: (){

                  showDialog(context: context, builder: (context){

  return  BackdropFilter(
    
   
    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    child: Dialog(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      // backgroundColor: Color(ColorsTheme.primaryColor),
      child: _dialogContent(),
    )
);
});
                 }, 
                 
                 child:
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                SvgPicture.asset("assets/icons/icon_cancelSubscription.svg", height: 25,width: 25,),
                SizedBox(width: 2.sp,),
                
                CustomText(onTap: (){

                


                  
                }, text: "Cancel Subscription", style: CustomTextTheme.normal400Text(size: 4.sp))
                ],)),
            ),
         
         
         
          ],
        ),
      )
    ;
  }
}




Widget _dialogContent() {

  return Container(
    height: 25.h,
    width: 35.w,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // color: Color(ColorsTheme.primaryColor)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        

        GradientText("You’ll no longer have access to exclusive features!", gradient: LinearGradient(
                                                     begin: Alignment.topLeft,
                                                   end: Alignment.bottomRight,
                                                     colors: <Color>[
                                                       Color(ColorsTheme.primaryColor),
                                                       Color(ColorsTheme.tertiaryColor),
                                                       Color(ColorsTheme.secondaryColor),
                                                     ],
                 
                  ),
                
                  
                  style: CustomTextTheme.normal400Text(size: 5.sp),
                  
                  ),


SizedBox(height: 2.sp,),
CustomText(onTap: (){}, text:  "Are you sure want to end subscription?", style: CustomTextTheme.normal400Text(size: 4.sp) ,),


customContainer(
  width: 6.w,
  height: 4.h,
  child:   RaisedGradientButton(child: Text("Sure?"), gradient: LinearGradient(
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
    ),

   
    
    
  );
}

