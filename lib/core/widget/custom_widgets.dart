

import 'package:marquee/marquee.dart';
import 'package:shoort/core/base_package.dart';
import 'package:image_picker/image_picker.dart';

/// Widgets class


class CustomWidgets {
  CustomWidgets(_);

  //Widgets
  static Widget socialBox({height, width, image, onTap, color, radius = 15.0}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              border: Border.all(
                color: Color(ColorsTheme.primaryWhite),
                width: 0.9,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}

/// Custom  Text Field
class CustomTextFiled extends StatefulWidget {



  CustomTextFiled({
    this.titleText = '',
    this.titleTextAlign = TextAlign.center,
     this.isPassword = false,
    required this.hintText,
    required this.textController,
     required this.icon,
    required this.hintTextStyle,
     this.isEmail = false,
     this.isUserName = false,
     this.isPhone = false,
     this.isConfirmPassword = false,
     this.password,
     this.controller,
     this.isEmpty = false,
     this.textFieldWidth = 25


  });

   final String titleText;
  final TextAlign titleTextAlign;
  final bool isPassword;
  final bool isEmail;
  final bool isUserName;
  final bool isPhone;
  final bool isConfirmPassword;
  final String hintText;
  final Icon icon;
  final TextEditingController textController;
  final TextStyle hintTextStyle;
  final String? password;
  final controller;
  final isEmpty ;
  double textFieldWidth;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {

   String validationError = "";
   bool isVisiblePassword = false;
   bool isPhoneFocus = false;


   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            height: 8.h,
            width: 30.3.w,
            decoration:   BoxDecoration(
              

                // color: Color(ColorsTheme.primaryBlack),
                // color: Color(ColorsTheme.secondaryBlack).withOpacity(0.25),
                gradient: LinearGradient(
                                       begin: Alignment.topCenter,
                                       end: Alignment.bottomCenter,
                                       colors: <Color>[
                                         Color(ColorsTheme.primaryColor),
                                         Color(ColorsTheme.tertiaryColor),
                                         Color(ColorsTheme.secondaryColor),
                                       ]
                ),
              
                borderRadius: BorderRadius.all(Radius.circular(12.0,))),
            child: Padding(
              padding: const EdgeInsets.all(1.75),
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
            
                    color: Color(ColorsTheme.secondaryBlack).withOpacity(1), 
                borderRadius: BorderRadius.all(Radius.circular(12.0,)),
                                         ),                       
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 2.w, child: widget.icon),
                   
                      Container(
                        padding: const EdgeInsets.only(left: 5.0,bottom: 3.0),
                        width: widget.textFieldWidth.w,
                        child: FocusScope(
                          child: Focus(
                            onFocusChange: (focus) {
                              setState(() {
                                // widget.isPhone?isPhoneFocus = true:isPhoneFocus = false;
              
                              });
                            },
              
                            child: 
                            
                            TextFormField(
                              
                              validator: (value)
                              {
              
                                ///Empty validator
                                if(widget.isEmpty==false){
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      validationError = 'Can\'t be empty';
                                    });
                                    return 'Can\'t be empty';
                                  }
                                }
              
                                ///Email validator
                                if (widget.isEmail) {
                                  final bool emailValid =
                                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+")
                                      .hasMatch(value!);
                                  if(!emailValid){
                                    setState(() {
                                      validationError = "Email is not valid!";
                                    });
                                    return "Email is not valid!";
                                  }
                                }
              
                                ///Password validator
                                if (widget.isPassword   ) {
              
                                  if(value!.length < 6){
                                    setState(() {
                                      validationError = "Password is too short!";
                                    });
                                    return "Password is too short!";
                                  }
              
                                  if(widget.isConfirmPassword){
                                    if(widget.controller.confirmPassword.value != widget.controller.password.value){
                                      setState(() {
                                        validationError = "Password is not matched!";
                                      });
                                      return "Password is not matched!";
                                    }else{
                                      validationError = "";
                                    }
                                  }
              
                                }
              
                                ///Confirm Password validator
                                if (widget.isConfirmPassword) {
              
                                  if(value!.length < 6){
                                    setState(() {
                                      validationError = "Password is too short!";
                                    });
                                    return "Password is too short!";
                                  }
              
                                  if(widget.controller.confirmPassword.value != widget.controller.password.value){
                                    setState(() {
                                      validationError = "Password is not matched!";
                                    });
                                    return "Password is not matched!";
                                  }else{
                                    validationError = "";
                                  }
              
              
              
                                }
              
                                setState(() {
                                  validationError = '';
                                });
                                return null;
                              },
                              cursorColor: Color(ColorsTheme.secondaryWhite),
              
                              obscureText: widget.isPassword?widget.isPassword == true && isVisiblePassword == false:widget.isConfirmPassword == true && isVisiblePassword == false,
                              onChanged: (value){
              
                                if(widget.isPassword){
                                  widget.textController.text = value;
                                 widget.controller.password.value = value;
              
                                }
              
                                print("$value");
              
                                if(widget.isConfirmPassword){
                                  widget.textController.text = value;
                                  widget.controller.confirmPassword.value = value;
                                }
              
                                if(widget.isPhone){
                                  widget.textController.text = "${value}";
                                }else{
                                  widget.textController.text = value;
                                }
              
              
                              },
                              decoration: InputDecoration(
                                // prefixIcon: widget.icon,
                                border: InputBorder.none,
                                hintText: widget.hintText, // pass the hint text parameter here
                                hintStyle: widget.hintTextStyle,
                                contentPadding: EdgeInsets.only(top: 2.sp),
                                errorText: '',
                                errorStyle: const TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                ),
                              ),
                              style: CustomTextTheme.normal400Text(),
                            ),
                          ),
                        ),
                      ),
                    
                    
                      widget.isPassword || widget.isConfirmPassword
                          ? 
                          GestureDetector(
                        onTap: (){
                          setState(() {
                            isVisiblePassword == true?isVisiblePassword = false:isVisiblePassword = true;
                          });
                        },
                            child: Container(padding: EdgeInsets.only(right: 0.0),width: 0.w, child: Icon(
              
                              isVisiblePassword?Icons.visibility:Icons.visibility_off,size: 4.sp, color: Color(ColorsTheme.secondaryWhite),)),
                          )
                          : 
                          Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
          validationError.length>3?CustomContainer(
              width: 80.w,
              child: CustomText(onTap: (){}, text: validationError, style: CustomTextTheme.normalSemiText().copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal, color: Color(ColorsTheme.primaryRed)))):SizedBox.shrink()
        ],
      ),
    );
  }
}


class CustomCouponTextFiled extends StatefulWidget {



  CustomCouponTextFiled({
    this.titleText = '',
    this.titleTextAlign = TextAlign.center,
    this.isPassword = false,
    required this.hintText,
    required this.textController,
    required this.hintTextStyle,
    this.isEmail = false,
    this.isUserName = false,
    this.isPhone = false,
    this.isConfirmPassword = false,
    this.password,
    this.controller,
    this.isEmpty = false,


  });

  final String titleText;
  final TextAlign titleTextAlign;
  final bool isPassword;
  final bool isEmail;
  final bool isUserName;
  final bool isPhone;
  final bool isConfirmPassword;
  final String hintText;
  final TextEditingController textController;
  final TextStyle hintTextStyle;
  final String? password;
  final controller;
  final isEmpty ;

  @override
  State<CustomCouponTextFiled> createState() => _CustomCouponTextFiled();
}

class _CustomCouponTextFiled extends State<CustomCouponTextFiled> {

  String validationError = "";
  bool isVisiblePassword = false;
  bool isPhoneFocus = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 6.h,
          width: 40.w,
          decoration: BoxDecoration(
            // color: Color(ColorsTheme.primaryBlack),
              color: Color(ColorsTheme.secondaryWhite),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 5.0,bottom: 3.0),
              width: 40.w,
              child: FocusScope(
                child: Focus(
                  onFocusChange: (focus) {
                    setState(() {

                    });
                  },

                  child: TextFormField(
                    validator: (value){

                      ///Empty validator
                      if(widget.isEmpty==false){
                        if (value == null || value.isEmpty) {
                          setState(() {
                            validationError = 'Can\'t be empty';
                          });
                          return 'Can\'t be empty';
                        }
                      }

                      ///Email validator
                      if (widget.isEmail) {
                        final bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if(!emailValid){
                          setState(() {
                            validationError = "Email is not valid!";
                          });
                          return "Email is not valid!";
                        }
                      }

                      ///Password validator
                      if (widget.isPassword   ) {

                        if(value!.length < 6){
                          setState(() {
                            validationError = "Password is too short!";
                          });
                          return "Password is too short!";
                        }

                        if(widget.isConfirmPassword){
                          if(widget.controller.confirmPassword.value != widget.controller.password.value){
                            setState(() {
                              validationError = "Password is not matched!";
                            });
                            return "Password is not matched!";
                          }else{
                            validationError = "";
                          }
                        }

                      }

                      ///Confirm Password validator
                      if (widget.isConfirmPassword) {

                        if(value!.length < 6){
                          setState(() {
                            validationError = "Password is too short!";
                          });
                          return "Password is too short!";
                        }

                        if(widget.controller.confirmPassword.value != widget.controller.password.value){
                          setState(() {
                            validationError = "Password is not matched!";
                          });
                          return "Password is not matched!";
                        }else{
                          validationError = "";
                        }



                      }

                      setState(() {
                        validationError = '';
                      });
                      return null;
                    },
                    cursorColor: Color(ColorsTheme.secondaryWhite),

                    obscureText: widget.isPassword?widget.isPassword == true && isVisiblePassword == false:widget.isConfirmPassword == true && isVisiblePassword == false,
                    onChanged: (value){

                      if(widget.isPassword){
                        widget.textController.text = value;
                        widget.controller.password.value = value;

                      }

                      print("$value");

                      if(widget.isConfirmPassword){
                        widget.textController.text = value;
                        widget.controller.confirmPassword.value = value;
                      }

                      if(widget.isPhone){
                        widget.textController.text = "${value}";
                      }else{
                        widget.textController.text = value;
                      }


                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText, // pass the hint text parameter here
                      hintStyle: widget.hintTextStyle,
                      contentPadding: EdgeInsets.only(top: 5.sp),
                      errorText: '',
                      errorStyle: TextStyle(
                        color: Colors.transparent,
                        fontSize: 0,
                      ),
                    ),
                    style: CustomTextTheme.normal400Text(),
                  ),
                ),
              ),
            ),
          ),
        ),
        validationError.length>3?CustomContainer(
            width: 80.w,
            child: CustomText(onTap: (){}, text: validationError, style: CustomTextTheme.normalSemiText().copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal, color: Color(ColorsTheme.primaryRed)))):SizedBox.shrink()
      ],
    );
  }
}



class CustomContainer extends StatelessWidget {
  CustomContainer(
      {this.height, this.width, this.color, this.child, this.paddingTop, this.onTap, this.decoration, this.paddingLeft, this.paddingRight, this.paddingBottom, this.transform});

  final height;
  final paddingTop;
  final paddingLeft;
  final paddingRight;
  final paddingBottom;
  final width;
  final color;
  final child;
  final onTap;
  final decoration;
  final transform;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? 10.sp,left: paddingLeft ?? 0.sp, right: paddingRight ?? 0.sp, bottom: paddingBottom ?? 0.sp),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            transform:transform,
            height: height,
            width: width,
            color: color,
            decoration: decoration,
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomScreenContainer extends StatelessWidget {
  CustomScreenContainer(
      {this.height, this.width, this.color, this.child, this.paddingTop, this.onTap});

  final height;
  final paddingTop;
  final width;
  final color;
  final child;
  final onTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
      color: Color(ColorsTheme.primaryBlack),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height,
          width: width,
          color: color,
          child: child,
        ),
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  CustomListTile({this.onTap, this.icon, this.title});

  final onTap;
  final icon;
  final title;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon!=null?Icon(icon,size: 25.sp, color: Color(ColorsTheme.primaryWhite),):SizedBox.shrink(),
      title: Text(title ?? "",style: CustomTextTheme.normalPrimaryText(),
    ),
    );
  }
}

CustomSnackBar({required errorHeading,required e, backgroundColor, textColor, duration}){
  Get.snackbar(errorHeading, "${e}",
    padding: EdgeInsets.all(10.sp),
    borderRadius: 0,

    backgroundColor: backgroundColor ?? Color(ColorsTheme.primaryBlack),
    colorText: textColor ?? Color(ColorsTheme.primaryWhite),
    snackPosition: SnackPosition.BOTTOM,
    icon: CustomContainer(

        height: 1.h,
        child: SvgPicture.asset("assets/icons/logo_white.svg",fit: BoxFit.cover,)),
    duration: duration ?? const Duration(seconds: 5),

  );

}

class CustomListTileSecond extends StatelessWidget {
  CustomListTileSecond({ this.title, this.trailing, this.isUpper = false});

  final title;
  final trailing;
  final isUpper;


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Text(title==null?"":isUpper==true?title.toUpperCase():title,style: CustomTextTheme.normal400Text().copyWith(color: Colors.white,fontWeight: FontWeight.bold,),

    ),
    );
  }
}

// class CustomAppBar extends StatelessWidget {
//   CustomAppBar(
//       {this.color, this.child, this.paddingTop});
//   final paddingTop;
//   final color;
//   final child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

///Custom App Bar

AppBar CustomAppBar({bool isBack = true,title, action , double ? paddingTop, double ? paddingLeft}){
  return AppBar(
    backgroundColor: Color(ColorsTheme.primaryBlack),
    elevation: 0,
      automaticallyImplyLeading:false,
      titleSpacing: 0.0,

      
    
    title: Center(
      child: Container(
        height: 5.h,
        // width: 100.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            isBack ? CustomContainer(
              paddingTop:paddingTop ?? 0.sp,
              paddingLeft: paddingLeft ?? 0.sp,
                onTap: (){Get.back();},
                child:Text("Back")) : Container(),
            title ?? SizedBox.shrink(),
          ],
        ),
      ),
    ),
    actions: action ?? [],
  );
}

///Custom Primary Button
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final  onPressed;

  RaisedGradientButton({
    required this.child,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          gradient: gradient,
        ),
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
              child: Center(
                child: child,
              )),
        ),
      ),
    );
  }
}


///Custom Text
class CustomText extends StatelessWidget {
  final Function onTap;
  final String text;
  final TextStyle style;
  final  textAlign;
  final  maxLine;

  CustomText({
    required this.onTap,
    required this.text,
    required this.style,
    this.textAlign,
    this.maxLine=5,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
           text, style: style,textAlign: textAlign,maxLines: maxLine,overflow: TextOverflow.ellipsis,
    );
  }
}


///Widgets
Widget customContainer({height, width, padding = 20.0, color, child}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Container(
      height: height,
      width: width,
      color: color,
      child: child,
    ),
  );
}


class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({
    required this.onTap,
      });

  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(ColorsTheme.primaryWhite),
                Color(ColorsTheme.primaryWhite),
                Color(ColorsTheme.primaryWhite),
              ]).createShader(
            Rect.fromLTWH(0, 3, bounds.width, bounds.height),
          ),
          child: Icon(Icons.camera_alt_outlined,size: 12.sp,)),
    );
  }
}

class MarqueeText extends StatelessWidget {
  final String text;
  final textStyle;

  const MarqueeText({Key? key, required this.text, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Marquee(
        text: text,
        style: textStyle,
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        velocity: 50.0,
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 20.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}

class CustomCircularProgressBar extends StatelessWidget {
final value;

const CustomCircularProgressBar({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.sp),
        child: CircularProgressIndicator(color: Color(ColorsTheme.primaryColor),
        value: value,
        ));
  }
}



class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        
      
        text,
        textAlign: TextAlign.center,
        
         style: style),
    );
  }
}




class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;

  UnicornOutlineButton({
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
  })  : this._painter = _GradientPainter(strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({required double strokeWidth, required double radius, required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth, size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}









