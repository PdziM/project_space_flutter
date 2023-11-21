import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../models/instagram_auth_token_fetcher_model.dart';

abstract class InstagramAuthTokenFetcherDataRepository {
  Future<Either<CustomException, InstagramAuthTokenFetcherModel>>
      authTokenFetcher({required InstagramAuthTokenFetcherFilter filter});
}
