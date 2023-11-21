import 'package:dartz/dartz.dart';

import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../models/astronomy_picture_day_model.dart';

abstract class AstronomyPictureDayDataRepository {
  Future<Either<CustomException, AstronomyPictureDayModel>>
      getAstronomyPictureDay({required AstronomyPictureDayFilter filter});
}
