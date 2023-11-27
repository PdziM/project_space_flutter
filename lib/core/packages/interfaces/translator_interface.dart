import 'package:dartz/dartz.dart';
import 'package:translator_plus/translator_plus.dart';

import '../../objects/exception/custom_exception.dart';

abstract class Translator {
  GoogleTranslator get translator;
  Future<Either<CustomException, Translation>> translateText(
      {required String text, required String from, required String to});
}
