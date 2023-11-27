import 'package:dartz/dartz.dart';
import 'package:translator_plus/translator_plus.dart';

import '../objects/exception/custom_exception.dart';
import 'interfaces/translator_interface.dart';

class TranslatorPackage extends Translator {
  final GoogleTranslator _translator;

  TranslatorPackage(this._translator);

  @override
  GoogleTranslator get translator => _translator;

  @override
  Future<Either<CustomException, Translation>> translateText(
      {required String text, required String from, required String to}) async {
    try {
      Translation translation =
          await _translator.translate(text, from: from, to: to);
      return Right(translation);
    } catch (e) {
      return Left(CustomException(e.toString()));
    }
  }
}
