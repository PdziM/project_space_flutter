import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../entities/instagram_auth_token_entity.dart';

abstract class InstagramAuthTokenFetcherRepository {
  Future<Either<CustomException, InstagramAuthTokenEntity>> authTokenFetcher(
      {required InstagramAuthTokenFetcherFilter filter});
}
