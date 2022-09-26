import 'package:september_flutter_challenge/models/original.dart';
import 'package:september_flutter_challenge/models/downsized.dart';

class Image {
  Original original;
  Downsized downsized;

  Image({
    required this.original,
    required this.downsized,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        original: Original.fromJson(json["original"]),
        downsized: Downsized.fromJson(json["downsized"]),
      );
}
