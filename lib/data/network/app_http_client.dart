import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/api_status/entity.failure.dart';

class AppHttpClient {
  AppHttpClient() {
    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: !false,
          error: true,
          compact: true,
        ),
    ]);
  }
  Dio dio = Dio(
    BaseOptions(
      // baseUrl: ApiEndPoints.baseUrl,
      contentType: null,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'User-Agent':
            'Android;com.example.pos_map_app;v=1.0.0;Developer:Pooria;Pooria@example.com',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<Either<FailureEntity, Response<T>>> get<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final dynamic data,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await dio.get<T>(
        path,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(res);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> post<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final failureOrResponse = await dio.post<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(failureOrResponse);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> put<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final failureOrResponse = await dio.put<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(failureOrResponse);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> patch<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final failureOrResponse = await dio.patch<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(failureOrResponse);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Future<Either<FailureEntity, Response<T>>> delete<T>(
    final String path, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final dynamic data,
    final CancelToken? cancelToken,
  }) async {
    try {
      final failureOrResponse = await dio.delete<T>(
        path,
        data: data,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
      );

      return Right(failureOrResponse);
    } on DioException catch (dioError) {
      return _handleException<T>(dioError);
    }
  }

  Left<FailureEntity, Response<T>> _handleException<T>(
    final DioException error,
  ) => _defaultExceptionHandler(error);

  Left<FailureEntity, Response<T>> _defaultExceptionHandler<T>(
    final DioException error,
  ) => Left(
    FailureEntity(
      message: error.message,
      statusCode: error.response?.statusCode,
    ),
  );
}
