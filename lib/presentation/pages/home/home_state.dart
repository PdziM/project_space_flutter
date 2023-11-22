import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/environment/environment.dart';
import '../../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../../../core/utils/functions.dart';
import '../../../domain/entities/astronomy_picture_day_entity.dart';
import '../../../domain/repositories/astronomy_picture_day_fetcher_repository.dart';
import '../../../domain/repositories/instagram_auth_token_fetcher_repository.dart';

class HomeState extends ChangeNotifier {
  final BuildContext _context;

  HomeState(this._context) {
    init();
  }

  init() {
    // getAstronomyPictureDay();
    // getToken();
  }

  AstronomyPictureDayEntity? astronomyPictureDayEntity;
  bool isLoading = false;

  void getAstronomyPictureDay() async {
    isLoading = true;
    notifyListeners();

    final res = await _context
        .read<AstronomyPictureDayFetcherRepository>()
        .astronomyPictureDayFetcher(
            filter: AstronomyPictureDayFilter(apiKey: Environment.apiKey));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      astronomyPictureDayEntity = r;
      nPrint(r);
    });

    isLoading = false;
    notifyListeners();
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

  //!
  String? date;
  bool get isDateValid => date != null && date!.isNotEmpty;

  TextEditingController dateController = TextEditingController(
      text: DateFormat('yyyy/MM/dd').format(DateTime.now()));

  void setDate(String? value) {
    date = value;
    dateController.text = value!;
    notifyListeners();
  }

  void datePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: _context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1997),
        lastDate: DateTime(DateTime.now().year + 1),
        locale: const Locale('pt'));

    if (datePicker != null) {
      String formattedDate = DateFormat('yyyy/MM/dd').format(datePicker);
      setDate(formattedDate);
    }
  }
}
