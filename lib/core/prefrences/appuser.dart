import 'package:hive/hive.dart';

part 'appuser.g.dart';

@HiveType(typeId: 1)
class AppUser extends HiveObject {

  @HiveField(0)
  String? email;

  @HiveField(1)
  String? token;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? phone;

  @HiveField(4)
  String? profileImage;

  @HiveField(5)
  List? projects;

  AppUser({this.email,this.token, this.name, this.phone, this.profileImage, this.projects});
}


