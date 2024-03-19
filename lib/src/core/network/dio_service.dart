import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/core/network/extensions.dart';

import '../../config/language/languages.dart';
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
      ..options.baseUrl = 'www.test.com/api/'
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 3)
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
      'lang': Languages.currentLanguage?.locale.languageCode ?? 'en',
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
        throw const SocketException('no_internet');
      case DioExceptionType.sendTimeout:
        throw const SocketException('no_internet');
      case DioExceptionType.receiveTimeout:
        throw const SocketException('no_internet');
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case 400:
            throw BadRequestException(
                error.response?.data['message'] ?? 'bad_request');
          case 401:
            throw UnauthorizedException(
                error.response?.data['message'] ?? 'unauthorized');
          case 404:
            throw const NotFoundException('not_found');
          case 409:
            throw ConflictException(
                error.response?.data['message'] ?? 'conflict');
          case 500:
            throw InternalServerErrorException(
                error.response?.data['message'] ?? 'server_error');
          default:
            throw const ServerException('server_error');
        }
      case DioExceptionType.cancel:
        throw const ServerException('request_cancelled');
      case DioExceptionType.unknown:
        throw ServerException(
            error.response?.data['message'] ?? 'unknown_error');
      default:
        throw ServerException(
            error.response?.data['message'] ?? 'unknown_error');
    }
  }
}