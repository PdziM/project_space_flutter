import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/di/dependency_injection.dart';
import 'core/environment/environment.dart';
import 'core/routes/app_routes.dart';
import 'core/services/http_client_service.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/astronomy_picture_day_data_repository.dart';
import 'data/repositories/instagram_auth_token_fetcher_data_repository.dart';
import 'domain/repositories/astronomy_picture_day_repository.dart';
import 'domain/repositories/instagram_auth_token_fetcher_repository.dart';
import 'main_state.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool isDarkModeOn = false;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<MainState>(create: (_) => MainState(context)),

        //SERVICES
        Provider<HttpClientService>(
            create: (_) => DependencyInjection.httpClientService),

        //DATA
        Provider<AstronomyPictureDayDataRepository>(
            create: (_) => DependencyInjection.astronomyPictureDayDataSource),

        Provider<InstagramAuthTokenFetcherDataRepository>(
            create: (_) =>
                DependencyInjection.instagramAuthTokenFetcherDataSource),

        //USE CASES
        Provider<AstronomyPictureDayRepository>(
            create: (_) => DependencyInjection.astronomyPictureDayUseCase),
        Provider<InstagramAuthTokenFetcherRepository>(
            create: (_) =>
                DependencyInjection.instagramAuthTokenFetcherUseCase),
      ],
      child: Consumer<MainState>(
        builder: (_, state, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightThemeData(),
            darkTheme: AppTheme().darkThemeData(),
            themeMode: isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
