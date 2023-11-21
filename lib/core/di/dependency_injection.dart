import 'package:dio/dio.dart';

import '../../data/datasources/astronomy_picture_day_datasource.dart';
import '../../data/datasources/instagram_auth_token_fetcher_datasource.dart';
import '../../domain/usecases/astronomy_picture_day_usecase.dart';
import '../../domain/usecases/instagram_auth_token_fetcher_usecase.dart';
import '../services/http_client_service.dart';

class DependencyInjection {
  static final dio = Dio();

  static final httpClientService = HttpClientService(dio);

  // DATA
  static final astronomyPictureDayDataSource =
      AstronomyPictureDayDataSource(httpClientService);

  static final instagramAuthTokenFetcherDataSource =
      InstagramAuthTokenFetcherDataSource(httpClientService);

  // USE CASES
  static final astronomyPictureDayUseCase =
      AstronomyPictureDayUseCase(astronomyPictureDayDataSource);

  static final instagramAuthTokenFetcherUseCase =
      InstagramAuthTokenFetcherUseCase(instagramAuthTokenFetcherDataSource);
}
