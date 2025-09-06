// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiStatus<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double? progress) loading,
    required TResult Function(FailureEntity failure) failure,
    required TResult Function(T result) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double? progress)? loading,
    TResult? Function(FailureEntity failure)? failure,
    TResult? Function(T result)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double? progress)? loading,
    TResult Function(FailureEntity failure)? failure,
    TResult Function(T result)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleApiStatus<T> value) idle,
    required TResult Function(LoadingApiStatus<T> value) loading,
    required TResult Function(FailureApiStatus<T> value) failure,
    required TResult Function(SuccessApiStatus<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleApiStatus<T> value)? idle,
    TResult? Function(LoadingApiStatus<T> value)? loading,
    TResult? Function(FailureApiStatus<T> value)? failure,
    TResult? Function(SuccessApiStatus<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleApiStatus<T> value)? idle,
    TResult Function(LoadingApiStatus<T> value)? loading,
    TResult Function(FailureApiStatus<T> value)? failure,
    TResult Function(SuccessApiStatus<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStatusCopyWith<T, $Res> {
  factory $ApiStatusCopyWith(
          ApiStatus<T> value, $Res Function(ApiStatus<T>) then) =
      _$ApiStatusCopyWithImpl<T, $Res, ApiStatus<T>>;
}

/// @nodoc
class _$ApiStatusCopyWithImpl<T, $Res, $Val extends ApiStatus<T>>
    implements $ApiStatusCopyWith<T, $Res> {
  _$ApiStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleApiStatusImplCopyWith<T, $Res> {
  factory _$$IdleApiStatusImplCopyWith(_$IdleApiStatusImpl<T> value,
          $Res Function(_$IdleApiStatusImpl<T>) then) =
      __$$IdleApiStatusImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleApiStatusImplCopyWithImpl<T, $Res>
    extends _$ApiStatusCopyWithImpl<T, $Res, _$IdleApiStatusImpl<T>>
    implements _$$IdleApiStatusImplCopyWith<T, $Res> {
  __$$IdleApiStatusImplCopyWithImpl(_$IdleApiStatusImpl<T> _value,
      $Res Function(_$IdleApiStatusImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleApiStatusImpl<T> implements IdleApiStatus<T> {
  const _$IdleApiStatusImpl();

  @override
  String toString() {
    return 'ApiStatus<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleApiStatusImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double? progress) loading,
    required TResult Function(FailureEntity failure) failure,
    required TResult Function(T result) success,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double? progress)? loading,
    TResult? Function(FailureEntity failure)? failure,
    TResult? Function(T result)? success,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double? progress)? loading,
    TResult Function(FailureEntity failure)? failure,
    TResult Function(T result)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleApiStatus<T> value) idle,
    required TResult Function(LoadingApiStatus<T> value) loading,
    required TResult Function(FailureApiStatus<T> value) failure,
    required TResult Function(SuccessApiStatus<T> value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleApiStatus<T> value)? idle,
    TResult? Function(LoadingApiStatus<T> value)? loading,
    TResult? Function(FailureApiStatus<T> value)? failure,
    TResult? Function(SuccessApiStatus<T> value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleApiStatus<T> value)? idle,
    TResult Function(LoadingApiStatus<T> value)? loading,
    TResult Function(FailureApiStatus<T> value)? failure,
    TResult Function(SuccessApiStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleApiStatus<T> implements ApiStatus<T> {
  const factory IdleApiStatus() = _$IdleApiStatusImpl<T>;
}

/// @nodoc
abstract class _$$LoadingApiStatusImplCopyWith<T, $Res> {
  factory _$$LoadingApiStatusImplCopyWith(_$LoadingApiStatusImpl<T> value,
          $Res Function(_$LoadingApiStatusImpl<T>) then) =
      __$$LoadingApiStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({double? progress});
}

/// @nodoc
class __$$LoadingApiStatusImplCopyWithImpl<T, $Res>
    extends _$ApiStatusCopyWithImpl<T, $Res, _$LoadingApiStatusImpl<T>>
    implements _$$LoadingApiStatusImplCopyWith<T, $Res> {
  __$$LoadingApiStatusImplCopyWithImpl(_$LoadingApiStatusImpl<T> _value,
      $Res Function(_$LoadingApiStatusImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = freezed,
  }) {
    return _then(_$LoadingApiStatusImpl<T>(
      freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$LoadingApiStatusImpl<T> implements LoadingApiStatus<T> {
  const _$LoadingApiStatusImpl([this.progress]);

  @override
  final double? progress;

  @override
  String toString() {
    return 'ApiStatus<$T>.loading(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingApiStatusImpl<T> &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingApiStatusImplCopyWith<T, _$LoadingApiStatusImpl<T>> get copyWith =>
      __$$LoadingApiStatusImplCopyWithImpl<T, _$LoadingApiStatusImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double? progress) loading,
    required TResult Function(FailureEntity failure) failure,
    required TResult Function(T result) success,
  }) {
    return loading(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double? progress)? loading,
    TResult? Function(FailureEntity failure)? failure,
    TResult? Function(T result)? success,
  }) {
    return loading?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double? progress)? loading,
    TResult Function(FailureEntity failure)? failure,
    TResult Function(T result)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleApiStatus<T> value) idle,
    required TResult Function(LoadingApiStatus<T> value) loading,
    required TResult Function(FailureApiStatus<T> value) failure,
    required TResult Function(SuccessApiStatus<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleApiStatus<T> value)? idle,
    TResult? Function(LoadingApiStatus<T> value)? loading,
    TResult? Function(FailureApiStatus<T> value)? failure,
    TResult? Function(SuccessApiStatus<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleApiStatus<T> value)? idle,
    TResult Function(LoadingApiStatus<T> value)? loading,
    TResult Function(FailureApiStatus<T> value)? failure,
    TResult Function(SuccessApiStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingApiStatus<T> implements ApiStatus<T> {
  const factory LoadingApiStatus([final double? progress]) =
      _$LoadingApiStatusImpl<T>;

  double? get progress;
  @JsonKey(ignore: true)
  _$$LoadingApiStatusImplCopyWith<T, _$LoadingApiStatusImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureApiStatusImplCopyWith<T, $Res> {
  factory _$$FailureApiStatusImplCopyWith(_$FailureApiStatusImpl<T> value,
          $Res Function(_$FailureApiStatusImpl<T>) then) =
      __$$FailureApiStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({FailureEntity failure});
}

/// @nodoc
class __$$FailureApiStatusImplCopyWithImpl<T, $Res>
    extends _$ApiStatusCopyWithImpl<T, $Res, _$FailureApiStatusImpl<T>>
    implements _$$FailureApiStatusImplCopyWith<T, $Res> {
  __$$FailureApiStatusImplCopyWithImpl(_$FailureApiStatusImpl<T> _value,
      $Res Function(_$FailureApiStatusImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$FailureApiStatusImpl<T>(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FailureEntity,
    ));
  }
}

/// @nodoc

class _$FailureApiStatusImpl<T> implements FailureApiStatus<T> {
  const _$FailureApiStatusImpl(this.failure);

  @override
  final FailureEntity failure;

  @override
  String toString() {
    return 'ApiStatus<$T>.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureApiStatusImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureApiStatusImplCopyWith<T, _$FailureApiStatusImpl<T>> get copyWith =>
      __$$FailureApiStatusImplCopyWithImpl<T, _$FailureApiStatusImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double? progress) loading,
    required TResult Function(FailureEntity failure) failure,
    required TResult Function(T result) success,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double? progress)? loading,
    TResult? Function(FailureEntity failure)? failure,
    TResult? Function(T result)? success,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double? progress)? loading,
    TResult Function(FailureEntity failure)? failure,
    TResult Function(T result)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleApiStatus<T> value) idle,
    required TResult Function(LoadingApiStatus<T> value) loading,
    required TResult Function(FailureApiStatus<T> value) failure,
    required TResult Function(SuccessApiStatus<T> value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleApiStatus<T> value)? idle,
    TResult? Function(LoadingApiStatus<T> value)? loading,
    TResult? Function(FailureApiStatus<T> value)? failure,
    TResult? Function(SuccessApiStatus<T> value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleApiStatus<T> value)? idle,
    TResult Function(LoadingApiStatus<T> value)? loading,
    TResult Function(FailureApiStatus<T> value)? failure,
    TResult Function(SuccessApiStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureApiStatus<T> implements ApiStatus<T> {
  const factory FailureApiStatus(final FailureEntity failure) =
      _$FailureApiStatusImpl<T>;

  FailureEntity get failure;
  @JsonKey(ignore: true)
  _$$FailureApiStatusImplCopyWith<T, _$FailureApiStatusImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessApiStatusImplCopyWith<T, $Res> {
  factory _$$SuccessApiStatusImplCopyWith(_$SuccessApiStatusImpl<T> value,
          $Res Function(_$SuccessApiStatusImpl<T>) then) =
      __$$SuccessApiStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T result});
}

/// @nodoc
class __$$SuccessApiStatusImplCopyWithImpl<T, $Res>
    extends _$ApiStatusCopyWithImpl<T, $Res, _$SuccessApiStatusImpl<T>>
    implements _$$SuccessApiStatusImplCopyWith<T, $Res> {
  __$$SuccessApiStatusImplCopyWithImpl(_$SuccessApiStatusImpl<T> _value,
      $Res Function(_$SuccessApiStatusImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$SuccessApiStatusImpl<T>(
      freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessApiStatusImpl<T> implements SuccessApiStatus<T> {
  const _$SuccessApiStatusImpl(this.result);

  @override
  final T result;

  @override
  String toString() {
    return 'ApiStatus<$T>.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessApiStatusImpl<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessApiStatusImplCopyWith<T, _$SuccessApiStatusImpl<T>> get copyWith =>
      __$$SuccessApiStatusImplCopyWithImpl<T, _$SuccessApiStatusImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(double? progress) loading,
    required TResult Function(FailureEntity failure) failure,
    required TResult Function(T result) success,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double? progress)? loading,
    TResult? Function(FailureEntity failure)? failure,
    TResult? Function(T result)? success,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double? progress)? loading,
    TResult Function(FailureEntity failure)? failure,
    TResult Function(T result)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleApiStatus<T> value) idle,
    required TResult Function(LoadingApiStatus<T> value) loading,
    required TResult Function(FailureApiStatus<T> value) failure,
    required TResult Function(SuccessApiStatus<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleApiStatus<T> value)? idle,
    TResult? Function(LoadingApiStatus<T> value)? loading,
    TResult? Function(FailureApiStatus<T> value)? failure,
    TResult? Function(SuccessApiStatus<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleApiStatus<T> value)? idle,
    TResult Function(LoadingApiStatus<T> value)? loading,
    TResult Function(FailureApiStatus<T> value)? failure,
    TResult Function(SuccessApiStatus<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessApiStatus<T> implements ApiStatus<T> {
  const factory SuccessApiStatus(final T result) = _$SuccessApiStatusImpl<T>;

  T get result;
  @JsonKey(ignore: true)
  _$$SuccessApiStatusImplCopyWith<T, _$SuccessApiStatusImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
