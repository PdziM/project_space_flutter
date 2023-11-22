import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/environment/environment.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../../core/services/interfaces/http_client_service.dart';
import '../models/instagram_auth_token_model.dart';
import '../repositories/instagram_auth_token_fetcher_data_repository.dart';

class InstagramAuthTokenFetcherDataSource
    extends InstagramAuthTokenFetcherDataRepository {
  final HttpClient _http;

  InstagramAuthTokenFetcherDataSource(this._http);

  @override
  Future<Either<CustomException, InstagramAuthTokenModel>> authTokenFetcher(
      {required InstagramAuthTokenFetcherFilter filter}) async {
    final res = await _http.get(
        '${Environment.instagramUrl}/oauth/access_token',
        queryParameters: filter.toMap());

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      if (r.statusCode != 200) {
        return Left(CustomException(
            'Opss.. ${jsonDecode(r.data)['error']['message']}'));
      }
      return Right(InstagramAuthTokenModel.fromJson(r.data));
    });
  }
}
