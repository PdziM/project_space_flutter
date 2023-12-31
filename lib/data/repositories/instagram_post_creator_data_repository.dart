import 'package:dartz/dartz.dart';

import '../../core/objects/exception/custom_exception.dart';
import '../../core/objects/filters/instagram_post_create_filter.dart';
import '../models/instagram_post_creator_model.dart';

abstract class InstagramPostCreatorDataRepository {
  Future<Either<CustomException, InstagramPostCreatorModel>>
      createMediaContainer({required InstagramPostCreateFilter filter});

  Future<Either<CustomException, InstagramPostCreatorModel>>
      publishMediaContainer({required InstagramPostCreateFilter filter});
}
