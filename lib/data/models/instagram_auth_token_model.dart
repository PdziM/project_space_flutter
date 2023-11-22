class InstagramAuthTokenModel {
  final String accessToken;
  final String tokenType;

  InstagramAuthTokenModel.fromJson(json)
      : accessToken = json['access_token'],
        tokenType = json['token_type'];
}
