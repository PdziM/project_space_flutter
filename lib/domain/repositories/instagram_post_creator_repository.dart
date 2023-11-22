import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_post_create_filter.dart';
import '../entities/instagram_post_creator_entity.dart';

abstract class InstagramPostCreatorRepository {
  Future<Either<CustomException, InstagramPostCreatorEntity>>
      createMediaContainer({required InstagramPostCreateFilter filter});

  Future<Either<CustomException, InstagramPostCreatorEntity>>
      publishMediaContainer({required InstagramPostCreateFilter filter});
}
