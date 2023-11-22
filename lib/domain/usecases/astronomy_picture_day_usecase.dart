import 'package:dartz/dartz.dart';

import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../data/repositories/astronomy_picture_day_data_repository.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../entities/astronomy_picture_day_entity.dart';
import '../repositories/astronomy_picture_day_repository.dart';

class AstronomyPictureDayUseCase implements AstronomyPictureDayRepository {
  final AstronomyPictureDayDataRepository _repository;

  AstronomyPictureDayUseCase(this._repository);

  @override
  Future<Either<CustomException, AstronomyPictureDayEntity>>
      fetchAstronomyPictureDay(
          {required AstronomyPictureDayFilter filter}) async {
    final res = await _repository.fetchAstronomyPictureDay(filter: filter);

    return res.fold((l) => Left(l), (r) async {
      return Right(AstronomyPictureDayEntity.fromModel(r));
    });
  }
}
