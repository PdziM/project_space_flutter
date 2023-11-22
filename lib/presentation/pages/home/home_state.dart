import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/environment/environment.dart';
import '../../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../../../core/utils/functions.dart';
import '../../../domain/repositories/astronomy_picture_day_fetcher_repository.dart';
import '../../../domain/repositories/instagram_auth_token_fetcher_repository.dart';

class HomeState extends ChangeNotifier {
  final BuildContext _context;

  HomeState(this._context) {
    init();
  }

  init() {
    // getAstronomyPictureDay();
    getToken();
  }

  void getAstronomyPictureDay() async {
    final res = await _context
        .read<AstronomyPictureDayFetcherRepository>()
        .astronomyPictureDayFetcher(
            filter: AstronomyPictureDayFilter(apiKey: Environment.apiKey));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      nPrint(r);
    });

    // notifyListeners();
  }

  void getToken() async {
    final res = await _context
        .read<InstagramAuthTokenFetcherRepository>()
        .authTokenFetcher(
            filter: InstagramAuthTokenFetcherFilter(
                clientId: Environment.clientId,
                clientSecret: Environment.clientSecret,
                grantType: Environment.grantType));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      nPrint(r);
    });

    // notifyListeners();
  }
}
