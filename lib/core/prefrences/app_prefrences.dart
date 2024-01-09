import 'package:hive/hive.dart';
import 'package:shoort/core/base_package.dart';
import 'package:shoort/core/prefrences/appuser.dart';

class AppPrefrences{

  static Box<AppUser> appUserBox = Hive.box(Constants.shoortBox);

  static addAppUserPrefrences(AppUser appUser) async{
    appUserBox.add(appUser);
  }

  static updateAppUserPrefrences(AppUser appUser){
    
    List appUsers = appUserBox.values.toList();
    AppUser personToUpdate = appUsers.first;
    personToUpdate.token = appUser.token;
    personToUpdate.email = appUser.email;
    personToUpdate.name = appUser.name;
    personToUpdate.phone = appUser.phone;
    personToUpdate.profileImage = appUser.profileImage;
    personToUpdate.projects = appUser.projects;
    appUserBox.putAt(0, personToUpdate);
    
  }

  static getAppUserToken(){
    return appUserBox.values.first.token;
  }

  static getAppUserName(){
    return appUserBox.values.first.name;
  }

  static getAppUser(){
    return AppUser(name: appUserBox.values.first.name, email: appUserBox.values.first.email, phone: appUserBox.values.first.phone,profileImage: appUserBox.values.first.profileImage,projects: appUserBox.values.first.projects, );
  }

  static deleteAllPrefrences() async{
   await appUserBox.clear();
  }

}