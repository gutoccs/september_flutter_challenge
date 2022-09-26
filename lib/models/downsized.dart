class Downsized {
  int height;
  int width;
  int size;
  String url;

  Downsized({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory Downsized.fromJson(Map<String, dynamic> json) => Downsized(
        height: int.parse(json["height"]),
        width: int.parse(json["width"]),
        size: int.parse(json["size"]),
        url: json["url"],
      );
}
