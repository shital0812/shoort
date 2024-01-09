
import 'package:shoort/core/prefrences/app_prefrences.dart';
import 'package:shoort/core/prefrences/appuser.dart';
import 'package:shoort/core/repository/api_repository.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/modules/account/models/app_user_profile.dart';
import 'package:shoort/modules/account/models/token_model.dart';

 class ApiService{
   static final  apiRepository = APIRepository();
   var AUTH_TOKEN = "";



  ///Sign UP New User
  Future<int?> signup({required gmail}) async{
    var body = { "email": gmail};
    // add auth token to headers
    try {
      final response = await apiRepository.post(Constants.signUpUrl,body: body);
      if (response.statusCode == 200||response.statusCode == 201) {
        Token token = await tokenFromJson(response.body);
        await AppPrefrences.addAppUserPrefrences(AppUser(email: gmail, token: token.token!.access.toString()));

        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  ///Sign In User
  Future<int?> signin({required gmail}) async  {
    var body = { "email": gmail};
    // add auth token to headers
    try {
      final response = await apiRepository.post(Constants.signInUrl,body: body);
      print(" statu ${response.statusCode}");
      if (response.statusCode == 200||response.statusCode == 201) {
        Token token = await tokenFromJson(response.body);
        await AppPrefrences.addAppUserPrefrences(AppUser(email: gmail, token: token.token!.access.toString()));
        print("token : ${AppPrefrences.getAppUserToken()}");
        await ApiService.getProfileData();
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  ///update user profile data
  Future<int?> updateUserProfile({required AppUserProfile appUserProfile}) async{
    var headers = {'Accept': 'application/json','Content-Type': 'application/json'
    ,'Authorization': "Bearer ${AppPrefrences.getAppUserToken().toString()}"};

    print(AppPrefrences.getAppUserToken().toString());

    Map<String, dynamic> dataWithNUll = {'name':appUserProfile.name,'phone': appUserProfile.phone, 'profile_image':appUserProfile.profileImage};

    final data = Map.fromEntries(dataWithNUll.entries.where((e) => e.value != null));

     print(data.toString());
    // add auth token to headers
    try {
      final response = await apiRepository.post(Constants.updateUserData,headers: headers,body: data);
      print("Res......${response.body}");
      if (response.statusCode == 200) {
        CustomSnackBar(errorHeading: "Successfull!", e: Constants.detailsUpdatedSuccessfully,backgroundColor: Color(ColorsTheme.primaryGreen));
        return response.statusCode;
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  ///get user profile data
  static Future<int?> getProfileData() async{ 


    var headers = {'Accept': 'application/json','Content-Type': 'application/json'
      ,'Authorization': "Bearer ${AppPrefrences.getAppUserToken().toString()}"};
    // add auth token to headers
    try {
      final response = await apiRepository.get(Constants.profile,headers: headers);
      print("respo ${response.statusCode}");

      if (response.statusCode == 200||response.statusCode == 201) {
        AppUserProfile profile = appUserProfileFromJson(response.body);

        // Map<String, dynamic> appUserData = {"email": profile.email, "name": profile.name, "phone": profile.phone, "projects": profile.projects, "profileImage": profile.profileImage};
        // final data = Map.fromEntries(dataWithNUll.entries.where((e) => e.value != null));

        await AppPrefrences.updateAppUserPrefrences(AppUser(email: profile.email,token: AppPrefrences.getAppUserToken(), name: profile.name, phone: profile.phone, projects: profile.projects, profileImage: profile.profileImage));
        print("respo token ${AppPrefrences.getAppUserToken()}");
        print("respo name ${AppPrefrences.getAppUser().name}");


        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

 ///get transcription by project id
 Future<String?> getProjectTranscription({required int projectId}) async{
   var headers = {'Accept': 'application/json','Content-Type': 'application/json'
     ,'Authorization': "Bearer ${AppPrefrences.getAppUserToken().toString()}"};
   // add auth token to headers
   try {
     final response = await apiRepository.get("${Constants.transcribe}$projectId",headers: headers);
     print("respo ${response.statusCode}");

     if (response.statusCode == 200||response.statusCode == 201) {
        print(response.body);
       // Map<String, dynamic> appUserData = {"email": profile.email, "name": profile.name, "phone": profile.phone, "projects": profile.projects, "profileImage": profile.profileImage};
       // final data = Map.fromEntries(dataWithNUll.entries.where((e) => e.value != null));




       return response.body;
     } else {
       return "response.statusCode";
     }
   } catch (error) {
     print(error.toString());
   }
   return null;
 }


 }