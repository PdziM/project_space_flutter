import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../models/astronomy_picture_day_model.dart';

abstract class AstronomyPictureDayFetcherDataRepository {
  Future<Either<CustomException, AstronomyPictureDayModel>>
      astronomyPictureDayFetcher({required AstronomyPictureDayFilter filter});
}
