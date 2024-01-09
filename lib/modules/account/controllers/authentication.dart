import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/core/prefrences/appuser.dart';
import 'package:shoort/core/repository/api_service.dart';
import 'package:shoort/routes/app_routes.dart';
import 'package:shoort/core/base_package.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;

class AuthenticationHelper {
  AuthenticationHelper();

 final GoogleSignIn googleSignIn = GoogleSignIn(
clientId: "958241560468-sfnv8fp7dltgp4rgo5ph6r5pk43on3fb.apps.googleusercontent.com"

 );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

//   //Sign in with Google
//   signInWithGoogle() async {
//  try 
//  {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuth = await googleSignInAccount.authentication;

//         // final AuthCredential credential = GoogleAuthProvider.credential(
//         //   accessToken: googleSignInAuth.accessToken,
//         //   idToken: googleSignInAuth.idToken,
//         // );

//         Get.offAllNamed(AppRoutes.homeScreen);
        

//         // final UserCredential authResult = await _auth.signInWithCredential(credential);
//         // final User? user = authResult.user;
//         // return user;

//       }
//     } 
//     catch (error) {
//       print("Error during Google Sign-In: $error");
//       return null;
//     }








//     // UserCredential userByGoogle = await SignInWithGoogle();
//     // userByGoogle.credential != null
//     //     ? {Get.offAllNamed(AppRoutes.homeScreen)}
//     //     : {};
//   }

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      var statusCode = await ApiService().signup(gmail: email.trim());

      await ApiService.getProfileData();

      CustomSnackBar(
          e: Constants.accountCreatedSuccessfully,
          errorHeading: "Successfull!",
          backgroundColor: Color(ColorsTheme.primaryGreen));

      Get.offAllNamed(AppRoutes.homeScreen);
      return user;
    } on FirebaseAuthException catch (e) {
      CustomSnackBar(e: e.message, errorHeading: "Signup failed!");

      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      var statusCode = await ApiService().signin(gmail: email.trim());
      CustomSnackBar(
          e: Constants.loginSuccessfull,
          errorHeading: "Successfull!",
          backgroundColor: Color(ColorsTheme.primaryGreen));
      Get.offAllNamed(AppRoutes.homeScreen);
      return true;
    } on FirebaseAuthException catch (e) {
      CustomSnackBar(e: e.message, errorHeading: "Login failed!");
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
 await googleSignIn.disconnect();
  _auth.signOut();
 await googleSignIn.signOut();
    await _auth.signOut();
    await AppPrefrences.deleteAllPrefrences();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  //Current User
  User? getCurrentUser() {
    return user;
  }

  //Sign in with Facebook
  Future signInWithFacebook() async {
    debugPrint("FB Auth");
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      Get.offAllNamed(AppRoutes.homeScreen);
      return user;
    } on FirebaseAuthException catch (e) {
      CustomSnackBar(e: e.message, errorHeading: "Login failed!");

      return e.message;
    } // Once signed in, return the UserCredential
  }

  ///reset password
  Future resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim()).then((value) {
        CustomSnackBar(
            e: Constants.resetEmailSent,
            errorHeading: "Success!",
            backgroundColor: Color(ColorsTheme.primaryGreen),
            textColor: Color(ColorsTheme.primaryBlack));
      });
    } on FirebaseAuthException catch (e) {
      CustomSnackBar(
        e: e.message,
        errorHeading: "Reset failed!",
      );
      return e;
    }

    return null;
  }




 Future<void> SignInWithGoogle() async {

await googleSignIn.disconnect();





  // Initialize Firebase
  User? user;  

  // The `GoogleAuthProvider` can only be used while running on the web 

  GoogleAuthProvider authProvider = GoogleAuthProvider();

  try {
   

    final UserCredential userCredential = await _auth.signInWithPopup(authProvider);

    user = userCredential.user;


    

     if (user != null) {

      var ststuscode = await ApiService().signin(

        gmail: user?.email
      );

     if(ststuscode ==200   || ststuscode == 201) {

      var ststuscode = await ApiService.getProfileData();

Get.offAllNamed(AppRoutes.homeScreen); 

}

else{
 int ? response = await ApiService().signup(
        gmail: user?.email
      
      );

if(response ==200 || response ==201){
  
  Get.snackbar("Successfully", "Congratulations! you are registered successfully");


}




    debugPrint(user.uid);

      

// var ststuscode = await ApiService.getProfileData();







}




    // uid = user.uid;
    // name = user.displayName;
    // userEmail = user.email;
    // imageUrl = user.photoURL;

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('auth', true);


  }


  } catch (e) {
    await googleSignIn.disconnect();
    print(e.toString());
  }

 

}


/* 
  static Future SignInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

    int ? response = await ApiService().signup(
        gmail: googleUser?.email
      );

if(response ==200   || response == 201) {

var ststuscode = await ApiService.getProfileData();

if(ststuscode ==200   || ststuscode == 201) {
Get.offAllNamed(AppRoutes.homeScreen); 

}
else{
  // to do here
}
 
}

else{
var response = await ApiService().signin(gmail: googleUser?.email);

if(response ==200 || response == 201){
  await ApiService.getProfileData();
  Get.offAllNamed(AppRoutes.homeScreen); 
}

}
    
    // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      CustomSnackBar(e: e.message, errorHeading: "Signup failed!");

      return e.message;
    }
  }

 */














 Future<void> signInWithApple() async {
  
  


    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(

        scopes: [
          AppleIDAuthorizationScopes.fullName,
          AppleIDAuthorizationScopes.email],
        // ...
      );
      
      // Use the obtained credential to sign in with Firebase
      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final OAuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );



      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);



int ? response = await ApiService().signup(
        gmail: userCredential.user!.email!
      );

if(response == 200 || response ==201) {

var ststuscode = await ApiService.getProfileData();

if(ststuscode ==200   || ststuscode == 201) {
Get.offAllNamed(AppRoutes.homeScreen); 

}
else{
  // to do here
}
 
}

else{
var response = await ApiService().signin(gmail: userCredential.user!.email);

if(response ==200 || response == 201){
  await ApiService.getProfileData();
  Get.offAllNamed(AppRoutes.homeScreen); 
}

}




    } 

catch (e) {
      print('Error during Apple sign-in: $e');
    }
  }


}
