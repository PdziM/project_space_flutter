import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../../data/repositories/instagram_auth_token_fetcher_data_repository.dart';
import '../entities/instagram_auth_token_fetcher_entity.dart';
import '../repositories/instagram_auth_token_fetcher_repository.dart';

class InstagramAuthTokenFetcherUseCase
    extends InstagramAuthTokenFetcherRepository {
  final InstagramAuthTokenFetcherDataRepository _repository;

  InstagramAuthTokenFetcherUseCase(this._repository);

  @override
  Future<Either<CustomException, InstagramAuthTokenFetcherEntity>>
      authTokenFetcher(
          {required InstagramAuthTokenFetcherFilter filter}) async {
    final res = await _repository.authTokenFetcher(filter: filter);

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      return Right(InstagramAuthTokenFetcherEntity.fromModel(r));
    });
  }
}
