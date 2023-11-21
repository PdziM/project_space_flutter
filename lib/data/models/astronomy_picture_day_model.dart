class AstronomyPictureDayModel {
  final String copyright;
  final String explanation;
  final String hdUrl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  AstronomyPictureDayModel.fromJson(json)
      : copyright = json['copyright'],
        explanation = json['explanation'],
        hdUrl = json['hdurl'],
        mediaType = json['media_type'],
        serviceVersion = json['service_version'],
        title = json['title'],
        url = json['url'];
}
