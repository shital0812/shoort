// To parse this JSON data, do
//
//     final appUserProfile = appUserProfileFromJson(jsonString);

import 'dart:convert';

AppUserProfile appUserProfileFromJson(String str) => AppUserProfile.fromJson(json.decode(str));

String appUserProfileToJson(AppUserProfile data) => json.encode(data.toJson());

class AppUserProfile {
  final int? id;
  final String? email;
  final String? name;
  final String? phone;
  final dynamic profileImage;
  final List<dynamic>? projects;

  AppUserProfile({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.profileImage,
    this.projects,
  });

  factory AppUserProfile.fromJson(Map<String, dynamic> json) => AppUserProfile(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    phone: json["phone"],
    profileImage: json["profile_image"],
    projects: json["projects"] == null ? [] : List<dynamic>.from(json["projects"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "phone": phone,
    "profile_image": profileImage,
    "projects": projects == null ? [] : List<dynamic>.from(projects!.map((x) => x)),
  };
}
