import 'dart:ui';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/constant_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme{
  
  CustomTextTheme();

  static TextStyle accountPrimaryText(){
    return GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 10.sp, color: Color(ColorsTheme.primaryWhite));
    /*return TextStyle(color: Color(ColorsTheme.primaryWhite),
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,

    );*/
  }


  static TextStyle normalPrimaryText({size}){
    return GoogleFonts.inter(color: Color(ColorsTheme.primaryWhite),
      fontSize: size ?? 5.sp,);
  }


  static TextStyle normalPrimaryBoldText({size}){
    return GoogleFonts.inter(color: Color(ColorsTheme.primaryWhite),
      fontSize: size ?? 12.sp,fontWeight: FontWeight.w900);
  }


  static TextStyle normal400Text({var size , color}){
    return GoogleFonts.inter(fontWeight: FontWeight.w400,
      fontSize:size ?? 3.sp,
      color: color ?? Color(ColorsTheme.secondaryWhite)
      // color: Colors.white54
    );
  }

  static TextStyle normalSemiText({size}){
    return GoogleFonts.inter(fontWeight: FontWeight.w600,
        fontSize:size ?? 23.sp,
        // color: Color(ColorsTheme.primaryWhite)
        color: Color(ColorsTheme.primaryWhite)
      // color: Colors.white54
    );
  }


  static TextStyle textBoxHint(){
    return TextStyle(color: Color(ColorsTheme.primaryWhite),
      fontSize: 13.sp,

    );
  }




  

}