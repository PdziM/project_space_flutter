import 'dart:convert';

import '../../data/models/astronomy_picture_day_model.dart';

class AstronomyPictureDayEntity {
  final String copyright;
  final String explanation;
  final String hdUrl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  AstronomyPictureDayEntity({
    required this.copyright,
    required this.explanation,
    required this.hdUrl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'copyright': copyright,
      'explanation': explanation,
      'hdurl': hdUrl,
      'media_type': mediaType,
      'service_version': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  factory AstronomyPictureDayEntity.fromMap(Map<String, dynamic> map) {
    return AstronomyPictureDayEntity(
      copyright: map['copyright'] as String,
      explanation: map['explanation'] as String,
      hdUrl: map['hdurl'] as String,
      mediaType: map['media_type'] as String,
      serviceVersion: map['service_version'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AstronomyPictureDayEntity.fromJson(String source) =>
      AstronomyPictureDayEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AstronomyPictureDay(copyright: $copyright, explanation: $explanation, hdurl: $hdUrl, media_type: $mediaType, service_version: $serviceVersion, title: $title, url: $url)';
  }

  factory AstronomyPictureDayEntity.fromModel(AstronomyPictureDayModel model) {
    return AstronomyPictureDayEntity(
        copyright: model.copyright,
        explanation: model.explanation,
        hdUrl: model.hdUrl,
        mediaType: model.mediaType,
        serviceVersion: model.serviceVersion,
        title: model.title,
        url: model.url);
  }
}
