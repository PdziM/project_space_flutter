import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/di/dependency_injection.dart';
import 'core/environment/environment.dart';
import 'core/packages/translator_package.dart';
import 'core/routes/app_routes.dart';
import 'core/services/http_client_service.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/astronomy_picture_day_fetcher_data_repository.dart';
import 'data/repositories/instagram_auth_token_fetcher_data_repository.dart';
import 'data/repositories/instagram_post_creator_data_repository.dart';
import 'domain/repositories/astronomy_picture_day_fetcher_repository.dart';
import 'domain/repositories/instagram_auth_token_fetcher_repository.dart';
import 'domain/repositories/instagram_post_creator_repository.dart';
import 'main_state.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<MainState>(create: (_) => MainState(context)),

        //SERVICES
        Provider<HttpClientService>(
            create: (_) => DependencyInjection.httpClientService),

        //PACKAGES
        Provider<TranslatorPackage>(
            create: (_) => DependencyInjection.translatorPackage),

        //DATA
        Provider<AstronomyPictureDayFetcherDataRepository>(
            create: (_) => DependencyInjection.astronomyPictureDayDataSource),

        Provider<InstagramAuthTokenFetcherDataRepository>(
            create: (_) =>
                DependencyInjection.instagramAuthTokenFetcherDataSource),
        Provider<InstagramPostCreatorDataRepository>(
            create: (_) => DependencyInjection.instagramPostCreatorDataSource),

        //USE CASES
        Provider<AstronomyPictureDayFetcherRepository>(
            create: (_) => DependencyInjection.astronomyPictureDayUseCase),
        Provider<InstagramAuthTokenFetcherRepository>(
            create: (_) =>
                DependencyInjection.instagramAuthTokenFetcherUseCase),
        Provider<InstagramPostCreatorRepository>(
            create: (_) => DependencyInjection.instagramPostCreatorUseCase),
      ],
      child: Consumer<MainState>(
        builder: (_, state, __) {
          return MaterialApp(
            title: 'Astronomy Picture Of The Day',
            debugShowCheckedModeBanner: false,
            locale: const Locale('pt', 'BR'),
            supportedLocales: const [
              Locale('pt', 'BR'),
              Locale('en', 'US'),
              Locale('es', 'US')
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: AppTheme().lightThemeData(),
            darkTheme: AppTheme().darkThemeData(),
            themeMode: state.darkTheme ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/login',
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
