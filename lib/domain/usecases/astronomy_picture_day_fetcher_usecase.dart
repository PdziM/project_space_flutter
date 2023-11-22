import 'package:dartz/dartz.dart';

import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../data/repositories/astronomy_picture_day_fetcher_data_repository.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../entities/astronomy_picture_day_entity.dart';
import '../repositories/astronomy_picture_day_fetcher_repository.dart';

class AstronomyPictureDayFetcherUseCase
    implements AstronomyPictureDayFetcherRepository {
  final AstronomyPictureDayFetcherDataRepository _repository;

  AstronomyPictureDayFetcherUseCase(this._repository);

  @override
  Future<Either<CustomException, AstronomyPictureDayEntity>>
      astronomyPictureDayFetcher(
          {required AstronomyPictureDayFilter filter}) async {
    final res = await _repository.astronomyPictureDayFetcher(filter: filter);

    return res.fold((l) => Left(l), (r) async {
      return Right(AstronomyPictureDayEntity.fromModel(r));
    });
  }
}
