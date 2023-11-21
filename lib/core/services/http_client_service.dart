import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../objects/exception/custom_exception.dart';
import '../objects/named_file.dart';
import 'interfaces/http_client_service.dart';

class HttpClientService extends HttpClient {
  Dio _dio;

  @override
  Dio get dio => _dio;

  HttpClientService(this._dio) {
    BaseOptions baseOptions = BaseOptions(
      // baseUrl: Environment.apodUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: onRequest,
        onError: onError,
        onResponse: onResponse,
      ),
      LogInterceptor(
        requestHeader: true,
        responseBody: true,
        request: true,
        requestBody: false,
        responseHeader: true,
      ),
    ]);
  }

  Options options = Options(
    validateStatus: (status) {
      return true;
    },
  );

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final AuthDatastore datastore = Config.authDatastore;

    // Session? session;

    // final res = await datastore.loadSession();
    // res.fold((l) => null, (r) {
    //   session = r;
    // });

    // if (session == null) {
    // options.headers.addAll({'Content-Type': 'application/json'})
    // } else {
    // options.queryParameters['api_key'] = Environment.apiKey;
    options.headers.addAll({
      'Content-Type': 'application/json',
    });
    // }

    handler.next(options);
  }

  void onError(DioException error, ErrorInterceptorHandler handler) async {
    handler.next(error);
  }

  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  Future<Either<CustomException, Response>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: options);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? 'Erro Inesperado'));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path,
          data: data, queryParameters: queryParameters, options: options);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.patch(path, data: data, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, data: data, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> postMultiPart(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      required List<NamedFile> files}) async {
    try {
      Map<String, dynamic> formDataFields = {'data': data};

      for (var u in files) {
        File tempFile = File(u.path);
        formDataFields[u.name] =
            await MultipartFile.fromFile(tempFile.path, filename: u.name);
      }
      var formData = FormData.fromMap(formDataFields);

      final response = await _dio.post(path,
          data: formData, queryParameters: queryParameters, options: options);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  Either<CustomException, Response> _getResult(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok ||
            HttpStatus.created ||
            HttpStatus.badRequest ||
            HttpStatus.partialContent:
        return Right(response);
      case HttpStatus.unauthorized:
        return Left(CustomException("Por favor faça o login novamente"));
      case HttpStatus.gatewayTimeout:
        return Left(
            CustomException("Por favor verifique sua conexão com a internet"));
      default:
        return Left(
            CustomException("Por favor verifique sua conexão com a internet"));
    }
  }
}
