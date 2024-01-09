// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  final TokenClass? token;
  final String? msg;

  Token({
    this.token,
    this.msg,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"] == null ? null : TokenClass.fromJson(json["token"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "token": token?.toJson(),
    "msg": msg,
  };
}

class TokenClass {
  final String? refresh;
  final String? access;

  TokenClass({
    this.refresh,
    this.access,
  });

  factory TokenClass.fromJson(Map<String, dynamic> json) => TokenClass(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}
