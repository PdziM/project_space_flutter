import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_post_create_filter.dart';
import '../../data/repositories/instagram_post_creator_data_repository.dart';
import '../entities/instagram_post_creator_entity.dart';
import '../repositories/instagram_post_creator_repository.dart';

class InstagramPostCreatorUseCase extends InstagramPostCreatorRepository {
  final InstagramPostCreatorDataRepository _repository;

  InstagramPostCreatorUseCase(this._repository);

  @override
  Future<Either<CustomException, InstagramPostCreatorEntity>>
      createMediaContainer({required InstagramPostCreateFilter filter}) async {
    final res = await _repository.createMediaContainer(filter: filter);

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      return Right(InstagramPostCreatorEntity.fromModel(r));
    });
  }

  @override
  Future<Either<CustomException, InstagramPostCreatorEntity>>
      publishMediaContainer({required InstagramPostCreateFilter filter}) async {
    final res = await _repository.createMediaContainer(filter: filter);

    return res.fold((l) => Left(CustomException('Opss.. $l')), (r) {
      return Right(InstagramPostCreatorEntity.fromModel(r));
    });
  }
}
