import 'package:dartz/dartz.dart' show Either;
import 'package:dio/dio.dart';

import '../../objects/exception/custom_exception.dart';
import '../../objects/named_file.dart';

abstract class HttpClient {
  Dio get dio;
  Future<Either<CustomException, Response>> get(String path,
      {Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> postMultiPart(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      required List<NamedFile> files});
  Future<Either<CustomException, Response>> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
}
