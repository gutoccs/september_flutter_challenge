// GIF Object

import 'package:september_flutter_challenge/models/image.dart';

class Gif {
  String type;
  String id;
  String url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String importDatetime;
  String? trendingDatetime;
  Image images;

  Gif({
    required this.type,
    required this.id,
    required this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    required this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    required this.importDatetime,
    this.trendingDatetime,
    required this.images,
  });

  factory Gif.fromJson(Map<String, dynamic> json) => Gif(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        slug: json["slug"],
        bitlyGifUrl: json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"],
        embedUrl: json["embed_url"],
        username: json["username"],
        source: json["source"],
        title: json["title"],
        rating: json["rating"],
        contentUrl: json["content_url"],
        sourceTld: json["source_tld"],
        sourcePostUrl: json["source_post_url"],
        isSticker: json["is_sticker"],
        importDatetime: json["import_datetime"],
        trendingDatetime: json["trending_datetime"],
        images: Image.fromJson(json["images"]),
      );
}
