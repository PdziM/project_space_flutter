class InstagramAuthTokenFetcherModel {
  final String accessToken;
  final String tokenType;

  InstagramAuthTokenFetcherModel.fromJson(json)
      : accessToken = json['access_token'],
        tokenType = json['token_type'];
}
