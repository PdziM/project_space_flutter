class InstagramAuthTokenFetcherFilter {
  final String clientId;
  final String clientSecret;
  final String grantType;

  InstagramAuthTokenFetcherFilter({
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': grantType,
    };
  }
}
