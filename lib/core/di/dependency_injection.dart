import 'package:dio/dio.dart';
import 'package:translator_plus/translator_plus.dart';

import '../../data/datasources/astronomy_picture_day_fetcher_datasource.dart';
import '../../data/datasources/instagram_auth_token_fetcher_datasource.dart';
import '../../data/datasources/instagram_post_creator_datasource.dart';
import '../../domain/usecases/astronomy_picture_day_fetcher_usecase.dart';
import '../../domain/usecases/instagram_auth_token_fetcher_usecase.dart';
import '../../domain/usecases/instagram_post_creator_usecase.dart';
import '../packages/translator_package.dart';
import '../services/http_client_service.dart';

class DependencyInjection {
  // SERVICES
  static final dio = Dio();
  static final httpClientService = HttpClientService(dio);

  // PACKAGES
  static final translator = GoogleTranslator();
  static final translatorPackage = TranslatorPackage(translator);

  // DATA
  static final astronomyPictureDayDataSource =
      AstronomyPictureDayFetcherDataSource(httpClientService);

  static final instagramAuthTokenFetcherDataSource =
      InstagramAuthTokenFetcherDataSource(httpClientService);

  static final instagramPostCreatorDataSource =
      InstagramPostCreatorDataSource(httpClientService);

  // USE CASES
  static final astronomyPictureDayUseCase =
      AstronomyPictureDayFetcherUseCase(astronomyPictureDayDataSource);

  static final instagramAuthTokenFetcherUseCase =
      InstagramAuthTokenFetcherUseCase(instagramAuthTokenFetcherDataSource);

  static final instagramPostCreatorUseCase =
      InstagramPostCreatorUseCase(instagramPostCreatorDataSource);
}
