import 'package:dartz/dartz.dart';

import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../entities/astronomy_picture_day_entity.dart';

abstract class AstronomyPictureDayFetcherRepository {
  Future<Either<CustomException, AstronomyPictureDayEntity>>
      astronomyPictureDayFetcher({required AstronomyPictureDayFilter filter});
}
