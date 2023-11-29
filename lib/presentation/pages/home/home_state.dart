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
    fetchAstronomyPictureDay();
    // getToken();
  }

  // i7D6JbDbXSYp8nU

  AstronomyPictureDayEntity? astronomyPictureDayEntity;
  bool isLoadingAstronomyPictureDay = false;

  void fetchAstronomyPictureDay() async {
    isLoadingAstronomyPictureDay = true;
    notifyListeners();

    final res = await _context
        .read<AstronomyPictureDayFetcherRepository>()
        .astronomyPictureDayFetcher(
            filter: AstronomyPictureDayFilter(
                apiKey: Environment.apiKey, date: date));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) async {
      astronomyPictureDayEntity = r;

      astronomyPictureDayEntity!.explanation =
          await translateText(text: r.explanation);
      astronomyPictureDayEntity!.title = await translateText(text: r.title);
    });

    isLoadingAstronomyPictureDay = false;
    notifyListeners();
  }

  Future<String> translateText(
      {required String text, String? from = 'en', String? to = 'pt'}) async {
    Translation? translatedText;
    final res = await _context
        .read<TranslatorPackage>()
        .translateText(text: text, from: from!, to: to!);

    res.fold((l) => null, (r) => translatedText = r);

    return translatedText!.text;
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

  bool isLoadingCreateMediaContainer = false;

  void createContainerMedia() async {
    isLoadingCreateMediaContainer = true;
    notifyListeners();

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

    isLoadingCreateMediaContainer = false;
    notifyListeners();
  }

  void publishMediaContainer(
      {required String accessToken, required String id}) async {
    isLoadingCreateMediaContainer = true;
    notifyListeners();

    final res = await _context
        .read<InstagramPostCreatorRepository>()
        .publishMediaContainer(
            filter: InstagramPostCreateFilter(
                accessToken: accessToken,
                creationId: id,
                caption: astronomyPictureDayEntity!.explanation,
                imageUrl: astronomyPictureDayEntity!.hdUrl));

    res.fold((l) {
      showCustomError(context: _context, message: 'Opss.. ${l.message}');
    }, (r) {
      print(r.toJson());
    });

    isLoadingCreateMediaContainer = false;
    notifyListeners();
  }

  //!
  String? date;
  bool get isDateValid => date != null && date!.isNotEmpty;

  TextEditingController dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

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
      String formattedDate = DateFormat('yyyy-MM-dd').format(datePicker);
      setDate(formattedDate);
    }
  }
}
