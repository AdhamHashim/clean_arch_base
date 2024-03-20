import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/config/res/app_strings.dart';
import 'package:flutter_base/src/config/res/constans_manager.dart';
import 'package:flutter_base/src/core/network/extensions.dart';

import '../../config/language/languages.dart';
import '../../config/res/status_code.dart';
import '../error/exceptions.dart';
import '../shared/global_user_data.dart';
import 'network_request.dart';
import 'network_service.dart';

class DioService implements NetworkService {
  late Dio _dio;

  DioService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.BASE_URL
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.CONECT_TIME_OUT,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.RECIEVE_TIME_OUT,
      )
      ..options.responseType = ResponseType.json;

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true));
    }
  }

  Map<String, dynamic> _getDefaultHeaders(bool isWithoutToken) {
    final Map<String, dynamic> headers = {};
    headers.addAll({
      HttpHeaders.acceptHeader: ContentType.json,
      'lang': Languages.currentLanguage?.locale.languageCode ??
          Languages.english.languageCode,
    });
    if (isWithoutToken != true) {
      headers['Authorization'] = 'Bearer ${GlobalUserData().token}';
    }
    return headers;
  }

  @override
  Future<Model> callApi<Model>(NetworkRequest networkRequest,
      {Model Function(Map<String, dynamic> json)? mapper}) async {
    try {
      await networkRequest.prepareRequestData();
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
              method: networkRequest.asString(),
              headers: _getDefaultHeaders(networkRequest.requestWithOutToken)));
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
        throw SocketException(AppString.checkInternet.tr());
      case DioExceptionType.sendTimeout:
        throw SocketException(AppString.checkInternet.tr());
      case DioExceptionType.receiveTimeout:
        throw SocketException(AppString.checkInternet.tr());
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
              error.response?.data['message'] ?? AppString.badRequest.tr(),
            );
          case StatusCode.unauthorized:
            throw UnauthorizedException(
              error.response?.data['message'] ?? AppString.unauthorized.tr(),
            );
          case StatusCode.notFound:
            throw NotFoundException(AppString.notFound.tr());
          case StatusCode.conflict:
            throw ConflictException(
              error.response?.data['message'] ?? AppString.serverError.tr(),
            );
          case StatusCode.internalServerError:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? AppString.serverError.tr(),
            );
          default:
            throw ServerException(AppString.serverError.tr());
        }
      case DioExceptionType.cancel:
        throw ServerException(AppString.intenetWeaness.tr());
      case DioExceptionType.unknown:
        throw ServerException(
          error.response?.data['message'] ?? AppString.error.tr(),
        );
      default:
        throw ServerException(
          error.response?.data['message'] ?? AppString.error.tr(),
        );
    }
  }
}
