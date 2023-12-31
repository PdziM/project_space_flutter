// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../data/models/instagram_auth_token_model.dart';

class InstagramAuthTokenEntity {
  final String accessToken;
  final String tokenType;

  InstagramAuthTokenEntity({
    required this.accessToken,
    required this.tokenType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'tokenType': tokenType,
    };
  }

  factory InstagramAuthTokenEntity.fromMap(Map<String, dynamic> map) {
    return InstagramAuthTokenEntity(
      accessToken: map['accessToken'] as String,
      tokenType: map['tokenType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstagramAuthTokenEntity.fromJson(String source) =>
      InstagramAuthTokenEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InstagramAuthTokenFetcherEntity(accessToken: $accessToken, tokenType: $tokenType)';

  factory InstagramAuthTokenEntity.fromModel(InstagramAuthTokenModel model) {
    return InstagramAuthTokenEntity(
        accessToken: model.accessToken, tokenType: model.tokenType);
  }
}
