// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../data/models/instagram_auth_token_fetcher_model.dart';

class InstagramAuthTokenFetcherEntity {
  final String accessToken;
  final String tokenType;

  InstagramAuthTokenFetcherEntity({
    required this.accessToken,
    required this.tokenType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'tokenType': tokenType,
    };
  }

  factory InstagramAuthTokenFetcherEntity.fromMap(Map<String, dynamic> map) {
    return InstagramAuthTokenFetcherEntity(
      accessToken: map['accessToken'] as String,
      tokenType: map['tokenType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstagramAuthTokenFetcherEntity.fromJson(String source) =>
      InstagramAuthTokenFetcherEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InstagramAuthTokenFetcherEntity(accessToken: $accessToken, tokenType: $tokenType)';

  factory InstagramAuthTokenFetcherEntity.fromModel(
      InstagramAuthTokenFetcherModel model) {
    return InstagramAuthTokenFetcherEntity(
        accessToken: model.accessToken, tokenType: model.tokenType);
  }
}
