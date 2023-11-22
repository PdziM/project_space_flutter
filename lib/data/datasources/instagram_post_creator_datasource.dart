import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/environment/environment.dart';
import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_post_create_filter.dart';
import '../../core/services/interfaces/http_client_service.dart';
import '../models/instagram_post_creator_model.dart';
import '../repositories/instagram_post_creator_data_repository.dart';

class InstagramPostCreatorDataSource
    extends InstagramPostCreatorDataRepository {
  final HttpClient _http;

  InstagramPostCreatorDataSource(this._http);

  @override
  Future<Either<CustomException, InstagramPostCreatorModel>>
      createMediaContainer({required InstagramPostCreateFilter filter}) async {
    final res = await _http.post(
        '${Environment.instagramUrl}/${Environment.instagramApiVersion}/${Environment.clientId}/media',
        queryParameters: filter.toMap());

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      if (r.statusCode != 200) {
        return Left(CustomException(
            'Opss.. ${jsonDecode(r.data)['error']['message']}'));
      }
      return Right(InstagramPostCreatorModel.fromJson(r.data));
    });
  }

  @override
  Future<Either<CustomException, InstagramPostCreatorModel>>
      publishMediaContainer({required InstagramPostCreateFilter filter}) async {
    final res = await _http.post(
        '${Environment.instagramUrl}/${Environment.instagramApiVersion}/${Environment.clientId}/media_publish',
        queryParameters: filter.toMap());

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      if (r.statusCode != 200) {
        return Left(CustomException(
            'Opss.. ${jsonDecode(r.data)['error']['message']}'));
      }
      return Right(InstagramPostCreatorModel.fromJson(r.data));
    });
  }
}
