import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity.failure.dart';

part 'api_status.freezed.dart';

@freezed
class ApiStatus<T> with _$ApiStatus<T> {
  const factory ApiStatus.idle() = IdleApiStatus;
  const factory ApiStatus.loading([final double? progress]) = LoadingApiStatus;
  const factory ApiStatus.failure(final FailureEntity failure) =
      FailureApiStatus;
  const factory ApiStatus.success(final T result) = SuccessApiStatus;
}
