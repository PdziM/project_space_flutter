import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:translator_plus/translator_plus.dart';

import '../../../core/environment/environment.dart';
import '../../../core/objects/filters/astronomy_picture_day_filter.dart';
import '../../../core/objects/filters/instagram_auth_token_fetcher_filter.dart';
import '../../../core/objects/filters/instagram_post_create_filter.dart';
import '../../../core/packages/translator_package.dart';
import '../../../core/utils/functions.dart';
import '../../../domain/entities/astronomy_picture_day_entity.dart';
import '../../../domain/entities/instagram_auth_token_entity.dart';
import '../../../domain/repositories/astronomy_picture_day_fetcher_repository.dart';
import '../../../domain/repositories/instagram_auth_token_fetcher_repository.dart';
import '../../../domain/repositories/instagram_post_creator_repository.dart';

class HomeState extends ChangeNotifier {
  final BuildContext _context;
  final GoogleTranslator translator = GoogleTranslator();

  HomeState(this._context) {
    init();
  }

  init() async {
    getAstronomyPictureDay();
    // getToken();
  }

  AstronomyPictureDayEntity? astronomyPictureDayEntity;
  bool isLoading = false;
  Translation? explanation;

  void getAstronomyPictureDay() async {
    isLoading = true;
    notifyListeners();

    final res = await _context
        .read<AstronomyPictureDayFetcherRepository>()
        .astronomyPictureDayFetcher(
            filter: AstronomyPictureDayFilter(apiKey: Environment.apiKey));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) async {
      astronomyPictureDayEntity = r;
      final res = await _context
          .read<TranslatorPackage>()
          .translateText(text: r.explanation, from: 'en', to: 'pt');
      explanation = res.fold((l) => null, (r) => r);
      print(explanation!.text);
    });

    isLoading = false;
    notifyListeners();
  }

  InstagramAuthTokenEntity? auth;

  getToken() async {
    final res = await _context
        .read<InstagramAuthTokenFetcherRepository>()
        .authTokenFetcher(
            filter: InstagramAuthTokenFetcherFilter(
                clientId: Environment.clientId,
                clientSecret: Environment.clientSecret,
                grantType: Environment.grantType));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) async {
      auth = r;
    });

    notifyListeners();
  }

  void createContainerMedia() async {
    final res = await _context
        .read<InstagramPostCreatorRepository>()
        .createMediaContainer(
            filter: InstagramPostCreateFilter(accessToken: auth!.accessToken));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      nPrint(r);
      // publishMediaContainer(accessToken: auth!.accessToken, id: r.id);
    });

    notifyListeners();
  }

  void publishMediaContainer(
      {required String accessToken, required String id}) async {
    final res = await _context
        .read<InstagramPostCreatorRepository>()
        .publishMediaContainer(
            filter: InstagramPostCreateFilter(
                accessToken: accessToken,
                creationId: id,
                caption: explanation!.text,
                imageUrl: astronomyPictureDayEntity!.hdUrl));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      print(r.toJson());
    });

    notifyListeners();
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
