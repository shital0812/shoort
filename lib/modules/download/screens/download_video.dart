import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoort/core/base_package.dart';

import '../../../core/constant_colors.dart';
import '../../../core/widget/custom_widgets.dart';

class DownloadVideo extends StatelessWidget {
  const DownloadVideo({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
  
appBar:

 AppBar(

  automaticallyImplyLeading: false,
  backgroundColor: Colors.transparent,
  elevation: 0.0,
  titleSpacing: 0.0,
 actions: [
  
  const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Icon(Icons.help, size: 32,)
                          ),

                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: (){
                              Get.back();
                            },
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical:18.0),
                              child: CustomText(
                                onTap: (){},
                                text: "Edit Clip", 
                                style: TextStyle(color:Color(ColorsTheme.primaryWhite) , fontFamily: 'Roboto', fontSize: 13.sp ,),
                                ),
                            ),


                          ),

                          InkWell(
                            splashColor: Colors.transparent,
                           
                            highlightColor: Colors.transparent,
                            onTap: (){
                            //Get.toNamed(AppRoutes.videoPreviewScreen);
                            },
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical:18.0, horizontal: 12.0),
                              child: CustomText(
                                onTap: ()
                                {
                             
                                },

                                text: "Share", 
                                
                                style: TextStyle(color:Color(ColorsTheme.primaryWhite) , fontFamily: 'Roboto', fontSize: 13.sp ,),
                                
                                ),
                            ),

                            
                          )
                        ],
                      
                      
  leading: InkWell(
    onTap: (){
      Get.back();
    },
    child: const Icon(Icons.arrow_back, color: Colors.white,)),
),


       backgroundColor: Color(ColorsTheme.primaryBlack),

       body: Center(

        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: Container(
            height: 40.h,
            width: 100.w,
          
            decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
  color: Color(ColorsTheme.secondaryBlack),

            ),
          ),
        ),
       ),
       
       );
  }
}