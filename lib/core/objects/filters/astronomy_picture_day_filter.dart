class AstronomyPictureDayFilter {
  final String apiKey;
  final String? date;
  final String? startDate;
  final String? endDate;
  final String? count;
  final String? thumbs;

  AstronomyPictureDayFilter({
    required this.apiKey,
    this.date,
    this.startDate,
    this.endDate,
    this.count,
    this.thumbs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'api_key': apiKey,
      'date': date,
      'start_date': startDate,
      'end_date': endDate,
      'count': count,
      'thumbs': thumbs,
    };
  }
}
