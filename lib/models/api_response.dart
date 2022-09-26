import 'dart:convert';

import 'package:september_flutter_challenge/models/gif.dart';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

class ApiResponse {
  List<Gif>? gif;

  ApiResponse({this.gif});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        gif: List<Gif>.from(json["data"].map((x) => Gif.fromJson(x))),
      );
}
