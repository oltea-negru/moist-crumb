// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String city) loading,
    required TResult Function(String city, WeatherData weatherData) loaded,
    required TResult Function(
      String city,
      String message,
      WeatherData? previousData,
    )
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String city)? loading,
    TResult? Function(String city, WeatherData weatherData)? loaded,
    TResult? Function(String city, String message, WeatherData? previousData)?
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String city)? loading,
    TResult Function(String city, WeatherData weatherData)? loaded,
    TResult Function(String city, String message, WeatherData? previousData)?
    error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialState value) initial,
    required TResult Function(HomePageLoadingState value) loading,
    required TResult Function(HomePageLoadedState value) loaded,
    required TResult Function(HomePageErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageInitialState value)? initial,
    TResult? Function(HomePageLoadingState value)? loading,
    TResult? Function(HomePageLoadedState value)? loaded,
    TResult? Function(HomePageErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialState value)? initial,
    TResult Function(HomePageLoadingState value)? loading,
    TResult Function(HomePageLoadedState value)? loaded,
    TResult Function(HomePageErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
    HomePageState value,
    $Res Function(HomePageState) then,
  ) = _$HomePageStateCopyWithImpl<$Res, HomePageState>;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomePageInitialStateImplCopyWith<$Res> {
  factory _$$HomePageInitialStateImplCopyWith(
    _$HomePageInitialStateImpl value,
    $Res Function(_$HomePageInitialStateImpl) then,
  ) = __$$HomePageInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomePageInitialStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageInitialStateImpl>
    implements _$$HomePageInitialStateImplCopyWith<$Res> {
  __$$HomePageInitialStateImplCopyWithImpl(
    _$HomePageInitialStateImpl _value,
    $Res Function(_$HomePageInitialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomePageInitialStateImpl implements HomePageInitialState {
  const _$HomePageInitialStateImpl();

  @override
  String toString() {
    return 'HomePageState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String city) loading,
    required TResult Function(String city, WeatherData weatherData) loaded,
    required TResult Function(
      String city,
      String message,
      WeatherData? previousData,
    )
    error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String city)? loading,
    TResult? Function(String city, WeatherData weatherData)? loaded,
    TResult? Function(String city, String message, WeatherData? previousData)?
    error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String city)? loading,
    TResult Function(String city, WeatherData weatherData)? loaded,
    TResult Function(String city, String message, WeatherData? previousData)?
    error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialState value) initial,
    required TResult Function(HomePageLoadingState value) loading,
    required TResult Function(HomePageLoadedState value) loaded,
    required TResult Function(HomePageErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageInitialState value)? initial,
    TResult? Function(HomePageLoadingState value)? loading,
    TResult? Function(HomePageLoadedState value)? loaded,
    TResult? Function(HomePageErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialState value)? initial,
    TResult Function(HomePageLoadingState value)? loading,
    TResult Function(HomePageLoadedState value)? loaded,
    TResult Function(HomePageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomePageInitialState implements HomePageState {
  const factory HomePageInitialState() = _$HomePageInitialStateImpl;
}

/// @nodoc
abstract class _$$HomePageLoadingStateImplCopyWith<$Res> {
  factory _$$HomePageLoadingStateImplCopyWith(
    _$HomePageLoadingStateImpl value,
    $Res Function(_$HomePageLoadingStateImpl) then,
  ) = __$$HomePageLoadingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city});
}

/// @nodoc
class __$$HomePageLoadingStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageLoadingStateImpl>
    implements _$$HomePageLoadingStateImplCopyWith<$Res> {
  __$$HomePageLoadingStateImplCopyWithImpl(
    _$HomePageLoadingStateImpl _value,
    $Res Function(_$HomePageLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? city = null}) {
    return _then(
      _$HomePageLoadingStateImpl(
        null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HomePageLoadingStateImpl implements HomePageLoadingState {
  const _$HomePageLoadingStateImpl(this.city);

  @override
  final String city;

  @override
  String toString() {
    return 'HomePageState.loading(city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageLoadingStateImpl &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageLoadingStateImplCopyWith<_$HomePageLoadingStateImpl>
  get copyWith =>
      __$$HomePageLoadingStateImplCopyWithImpl<_$HomePageLoadingStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String city) loading,
    required TResult Function(String city, WeatherData weatherData) loaded,
    required TResult Function(
      String city,
      String message,
      WeatherData? previousData,
    )
    error,
  }) {
    return loading(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String city)? loading,
    TResult? Function(String city, WeatherData weatherData)? loaded,
    TResult? Function(String city, String message, WeatherData? previousData)?
    error,
  }) {
    return loading?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String city)? loading,
    TResult Function(String city, WeatherData weatherData)? loaded,
    TResult Function(String city, String message, WeatherData? previousData)?
    error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialState value) initial,
    required TResult Function(HomePageLoadingState value) loading,
    required TResult Function(HomePageLoadedState value) loaded,
    required TResult Function(HomePageErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageInitialState value)? initial,
    TResult? Function(HomePageLoadingState value)? loading,
    TResult? Function(HomePageLoadedState value)? loaded,
    TResult? Function(HomePageErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialState value)? initial,
    TResult Function(HomePageLoadingState value)? loading,
    TResult Function(HomePageLoadedState value)? loaded,
    TResult Function(HomePageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomePageLoadingState implements HomePageState {
  const factory HomePageLoadingState(final String city) =
      _$HomePageLoadingStateImpl;

  String get city;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageLoadingStateImplCopyWith<_$HomePageLoadingStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageLoadedStateImplCopyWith<$Res> {
  factory _$$HomePageLoadedStateImplCopyWith(
    _$HomePageLoadedStateImpl value,
    $Res Function(_$HomePageLoadedStateImpl) then,
  ) = __$$HomePageLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city, WeatherData weatherData});

  $WeatherDataCopyWith<$Res> get weatherData;
}

/// @nodoc
class __$$HomePageLoadedStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageLoadedStateImpl>
    implements _$$HomePageLoadedStateImplCopyWith<$Res> {
  __$$HomePageLoadedStateImplCopyWithImpl(
    _$HomePageLoadedStateImpl _value,
    $Res Function(_$HomePageLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? city = null, Object? weatherData = null}) {
    return _then(
      _$HomePageLoadedStateImpl(
        null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        null == weatherData
            ? _value.weatherData
            : weatherData // ignore: cast_nullable_to_non_nullable
                  as WeatherData,
      ),
    );
  }

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get weatherData {
    return $WeatherDataCopyWith<$Res>(_value.weatherData, (value) {
      return _then(_value.copyWith(weatherData: value));
    });
  }
}

/// @nodoc

class _$HomePageLoadedStateImpl implements HomePageLoadedState {
  const _$HomePageLoadedStateImpl(this.city, this.weatherData);

  @override
  final String city;
  @override
  final WeatherData weatherData;

  @override
  String toString() {
    return 'HomePageState.loaded(city: $city, weatherData: $weatherData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageLoadedStateImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.weatherData, weatherData) ||
                other.weatherData == weatherData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, weatherData);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageLoadedStateImplCopyWith<_$HomePageLoadedStateImpl> get copyWith =>
      __$$HomePageLoadedStateImplCopyWithImpl<_$HomePageLoadedStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String city) loading,
    required TResult Function(String city, WeatherData weatherData) loaded,
    required TResult Function(
      String city,
      String message,
      WeatherData? previousData,
    )
    error,
  }) {
    return loaded(city, weatherData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String city)? loading,
    TResult? Function(String city, WeatherData weatherData)? loaded,
    TResult? Function(String city, String message, WeatherData? previousData)?
    error,
  }) {
    return loaded?.call(city, weatherData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String city)? loading,
    TResult Function(String city, WeatherData weatherData)? loaded,
    TResult Function(String city, String message, WeatherData? previousData)?
    error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(city, weatherData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialState value) initial,
    required TResult Function(HomePageLoadingState value) loading,
    required TResult Function(HomePageLoadedState value) loaded,
    required TResult Function(HomePageErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageInitialState value)? initial,
    TResult? Function(HomePageLoadingState value)? loading,
    TResult? Function(HomePageLoadedState value)? loaded,
    TResult? Function(HomePageErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialState value)? initial,
    TResult Function(HomePageLoadingState value)? loading,
    TResult Function(HomePageLoadedState value)? loaded,
    TResult Function(HomePageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomePageLoadedState implements HomePageState {
  const factory HomePageLoadedState(
    final String city,
    final WeatherData weatherData,
  ) = _$HomePageLoadedStateImpl;

  String get city;
  WeatherData get weatherData;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageLoadedStateImplCopyWith<_$HomePageLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomePageErrorStateImplCopyWith<$Res> {
  factory _$$HomePageErrorStateImplCopyWith(
    _$HomePageErrorStateImpl value,
    $Res Function(_$HomePageErrorStateImpl) then,
  ) = __$$HomePageErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city, String message, WeatherData? previousData});

  $WeatherDataCopyWith<$Res>? get previousData;
}

/// @nodoc
class __$$HomePageErrorStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageErrorStateImpl>
    implements _$$HomePageErrorStateImplCopyWith<$Res> {
  __$$HomePageErrorStateImplCopyWithImpl(
    _$HomePageErrorStateImpl _value,
    $Res Function(_$HomePageErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? message = null,
    Object? previousData = freezed,
  }) {
    return _then(
      _$HomePageErrorStateImpl(
        null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        freezed == previousData
            ? _value.previousData
            : previousData // ignore: cast_nullable_to_non_nullable
                  as WeatherData?,
      ),
    );
  }

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res>? get previousData {
    if (_value.previousData == null) {
      return null;
    }

    return $WeatherDataCopyWith<$Res>(_value.previousData!, (value) {
      return _then(_value.copyWith(previousData: value));
    });
  }
}

/// @nodoc

class _$HomePageErrorStateImpl implements HomePageErrorState {
  const _$HomePageErrorStateImpl(this.city, this.message, this.previousData);

  @override
  final String city;
  @override
  final String message;
  @override
  final WeatherData? previousData;

  @override
  String toString() {
    return 'HomePageState.error(city: $city, message: $message, previousData: $previousData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageErrorStateImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.previousData, previousData) ||
                other.previousData == previousData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, message, previousData);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageErrorStateImplCopyWith<_$HomePageErrorStateImpl> get copyWith =>
      __$$HomePageErrorStateImplCopyWithImpl<_$HomePageErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String city) loading,
    required TResult Function(String city, WeatherData weatherData) loaded,
    required TResult Function(
      String city,
      String message,
      WeatherData? previousData,
    )
    error,
  }) {
    return error(city, message, previousData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String city)? loading,
    TResult? Function(String city, WeatherData weatherData)? loaded,
    TResult? Function(String city, String message, WeatherData? previousData)?
    error,
  }) {
    return error?.call(city, message, previousData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String city)? loading,
    TResult Function(String city, WeatherData weatherData)? loaded,
    TResult Function(String city, String message, WeatherData? previousData)?
    error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(city, message, previousData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialState value) initial,
    required TResult Function(HomePageLoadingState value) loading,
    required TResult Function(HomePageLoadedState value) loaded,
    required TResult Function(HomePageErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomePageInitialState value)? initial,
    TResult? Function(HomePageLoadingState value)? loading,
    TResult? Function(HomePageLoadedState value)? loaded,
    TResult? Function(HomePageErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialState value)? initial,
    TResult Function(HomePageLoadingState value)? loading,
    TResult Function(HomePageLoadedState value)? loaded,
    TResult Function(HomePageErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomePageErrorState implements HomePageState {
  const factory HomePageErrorState(
    final String city,
    final String message,
    final WeatherData? previousData,
  ) = _$HomePageErrorStateImpl;

  String get city;
  String get message;
  WeatherData? get previousData;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageErrorStateImplCopyWith<_$HomePageErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
