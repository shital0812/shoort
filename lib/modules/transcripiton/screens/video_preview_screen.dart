import 'package:shoort/core/base_package.dart';

class VideoPreviewScreen extends StatelessWidget {
  const VideoPreviewScreen({super.key});

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

      body: customContainer(
        height: Get.height,
        width: Get.width,
        color: Color(ColorsTheme.primaryBlack),
        
        
        child: ListView(
children: [

Container(height: 68.h,
width: 100.h,
color: Colors.white,),

Padding(
  padding:  EdgeInsets.symmetric(horizontal:20.w, vertical: 05.h),
  child:   RaisedGradientButton(
    
    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(ColorsTheme.primaryColor),
                        Color(ColorsTheme.tertiaryColor),
                        Color(ColorsTheme.secondaryColor),
                      ],
                    ),
  onPressed: (){
    
  Get.toNamed(AppRoutes.videoDownloadScreen);


  },
  child: CustomText(text: "Download", onTap: ()
  {
  
    
  },
  
  
  style: TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: Color(ColorsTheme.primaryWhite))),
  
  ),
)

],

        )
        )
    );
  }
}