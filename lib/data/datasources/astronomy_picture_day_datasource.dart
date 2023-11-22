import 'package:dartz/dartz.dart';

import '../../core/environment/environment.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../core/services/interfaces/http_client_service.dart';
import '../models/astronomy_picture_day_model.dart';
import '../repositories/astronomy_picture_day_data_repository.dart';

class AstronomyPictureDayDataSource extends AstronomyPictureDayDataRepository {
  final HttpClient _http;

  AstronomyPictureDayDataSource(this._http);

  @override
  Future<Either<CustomException, AstronomyPictureDayModel>>
      getAstronomyPictureDay(
          {required AstronomyPictureDayFilter filter}) async {
    final res =
        await _http.get(Environment.apodUrl, queryParameters: filter.toMap());

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      if (r.statusCode != 200) {
        return Left(CustomException('Opss.. ${r.data.msg}'));
      }
      return Right(AstronomyPictureDayModel.fromJson(r.data));
    });
  }
}
