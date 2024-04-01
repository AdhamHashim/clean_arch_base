import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/config/res/constans_manager.dart';
import 'package:flutter_base/src/core/helpers/cache_service.dart';
import 'package:flutter_base/src/core/network/extensions.dart';

import '../../config/language/languages.dart';
import '../../config/language/locale_keys.g.dart';
import '../../config/res/status_code.dart';
import '../error/exceptions.dart';
import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

class DioService implements NetworkService {
  late final Dio _dio;
  final _defaultHeaders = <String, dynamic>{};

  DioService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.recieveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json;

    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  Future<void> _getDefaultHeaders(bool isWithoutToken) async {
    _defaultHeaders[HttpHeaders.acceptHeader] = ContentType.json;
    _defaultHeaders['lang'] = Languages.currentLanguage?.locale.languageCode ??
        Languages.english.languageCode;
    final token = await _getToken();
    if (isWithoutToken != true && token != null) {
      _defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
    } else {
      _defaultHeaders.remove(HttpHeaders.authorizationHeader);
    }
  }

  Future<String?> _getToken() async {
    final token = await SecureStorage.read(ConstantManager.token);
    return token;
  }

  @override
  Future<Model> callApi<Model>(NetworkRequest networkRequest,
      {Model Function(dynamic json)? mapper}) async {
    try {
      await Future.wait([
        networkRequest.prepareRequestData(),
        _getDefaultHeaders(networkRequest.requestWithOutToken),
      ]);
      final response = await _dio.request(networkRequest.path,
          data: networkRequest.hasBodyAndProgress()
              ? networkRequest.isFormData
                  ? FormData.fromMap(networkRequest.body!)
                  : networkRequest.body
              : networkRequest.body,
          queryParameters: networkRequest.queryParameters,
          onSendProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onSendProgress
              : null,
          onReceiveProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onReceiveProgress
              : null,
          options: Options(
              method: networkRequest.asString(), headers: _defaultHeaders));
      if (mapper != null) {
        return mapper(response.data);
      } else {
        return response.data;
      }
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw SocketException(LocaleKeys.checkInternet.tr());
      case DioExceptionType.sendTimeout:
        throw SocketException(LocaleKeys.checkInternet.tr());
      case DioExceptionType.receiveTimeout:
        throw SocketException(LocaleKeys.checkInternet.tr());
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
              error.response?.data['message'] ?? LocaleKeys.bad_request.tr(),
            );
          case StatusCode.unauthorized:
            throw UnauthorizedException(
              error.response?.data['message'] ?? LocaleKeys.unauthorized.tr(),
            );
          case StatusCode.notFound:
            throw NotFoundException(LocaleKeys.notFound.tr());
          case StatusCode.conflict:
            throw ConflictException(
              error.response?.data['message'] ?? LocaleKeys.serverError.tr(),
            );
          case StatusCode.internalServerError:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? LocaleKeys.serverError.tr(),
            );
          default:
            throw ServerException(LocaleKeys.serverError.tr());
        }
      case DioExceptionType.cancel:
        throw ServerException(LocaleKeys.intenetWeaness.tr());
      case DioExceptionType.unknown:
        throw ServerException(
          error.response?.data['message'] ?? LocaleKeys.error.tr(),
        );
      default:
        throw ServerException(
          error.response?.data['message'] ?? LocaleKeys.error.tr(),
        );
    }
  }
}
