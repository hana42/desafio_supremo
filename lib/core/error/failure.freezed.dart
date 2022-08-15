// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() dataParsingFailure,
    required TResult Function() connectionFailure,
    required TResult Function() unkownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(DataParsingFailure value) dataParsingFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(UnkownFailure value) unkownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

/// @nodoc
abstract class _$$ServerFailureCopyWith<$Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure value, $Res Function(_$ServerFailure) then) =
      __$$ServerFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$ServerFailureCopyWith<$Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure _value, $Res Function(_$ServerFailure) _then)
      : super(_value, (v) => _then(v as _$ServerFailure));

  @override
  _$ServerFailure get _value => super._value as _$ServerFailure;
}

/// @nodoc

class _$ServerFailure extends ServerFailure {
  const _$ServerFailure() : super._();

  @override
  String toString() {
    return 'Failure.serverFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() dataParsingFailure,
    required TResult Function() connectionFailure,
    required TResult Function() unkownFailure,
  }) {
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
  }) {
    return serverFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(DataParsingFailure value) dataParsingFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(UnkownFailure value) unkownFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends Failure {
  const factory ServerFailure() = _$ServerFailure;
  const ServerFailure._() : super._();
}

/// @nodoc
abstract class _$$DataParsingFailureCopyWith<$Res> {
  factory _$$DataParsingFailureCopyWith(_$DataParsingFailure value,
          $Res Function(_$DataParsingFailure) then) =
      __$$DataParsingFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DataParsingFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$DataParsingFailureCopyWith<$Res> {
  __$$DataParsingFailureCopyWithImpl(
      _$DataParsingFailure _value, $Res Function(_$DataParsingFailure) _then)
      : super(_value, (v) => _then(v as _$DataParsingFailure));

  @override
  _$DataParsingFailure get _value => super._value as _$DataParsingFailure;
}

/// @nodoc

class _$DataParsingFailure extends DataParsingFailure {
  const _$DataParsingFailure() : super._();

  @override
  String toString() {
    return 'Failure.dataParsingFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DataParsingFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() dataParsingFailure,
    required TResult Function() connectionFailure,
    required TResult Function() unkownFailure,
  }) {
    return dataParsingFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
  }) {
    return dataParsingFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
    required TResult orElse(),
  }) {
    if (dataParsingFailure != null) {
      return dataParsingFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(DataParsingFailure value) dataParsingFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(UnkownFailure value) unkownFailure,
  }) {
    return dataParsingFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
  }) {
    return dataParsingFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
    required TResult orElse(),
  }) {
    if (dataParsingFailure != null) {
      return dataParsingFailure(this);
    }
    return orElse();
  }
}

abstract class DataParsingFailure extends Failure {
  const factory DataParsingFailure() = _$DataParsingFailure;
  const DataParsingFailure._() : super._();
}

/// @nodoc
abstract class _$$ConnectionFailureCopyWith<$Res> {
  factory _$$ConnectionFailureCopyWith(
          _$ConnectionFailure value, $Res Function(_$ConnectionFailure) then) =
      __$$ConnectionFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$ConnectionFailureCopyWith<$Res> {
  __$$ConnectionFailureCopyWithImpl(
      _$ConnectionFailure _value, $Res Function(_$ConnectionFailure) _then)
      : super(_value, (v) => _then(v as _$ConnectionFailure));

  @override
  _$ConnectionFailure get _value => super._value as _$ConnectionFailure;
}

/// @nodoc

class _$ConnectionFailure extends ConnectionFailure {
  const _$ConnectionFailure() : super._();

  @override
  String toString() {
    return 'Failure.connectionFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectionFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() dataParsingFailure,
    required TResult Function() connectionFailure,
    required TResult Function() unkownFailure,
  }) {
    return connectionFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
  }) {
    return connectionFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
    required TResult orElse(),
  }) {
    if (connectionFailure != null) {
      return connectionFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(DataParsingFailure value) dataParsingFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(UnkownFailure value) unkownFailure,
  }) {
    return connectionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
  }) {
    return connectionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
    required TResult orElse(),
  }) {
    if (connectionFailure != null) {
      return connectionFailure(this);
    }
    return orElse();
  }
}

abstract class ConnectionFailure extends Failure {
  const factory ConnectionFailure() = _$ConnectionFailure;
  const ConnectionFailure._() : super._();
}

/// @nodoc
abstract class _$$UnkownFailureCopyWith<$Res> {
  factory _$$UnkownFailureCopyWith(
          _$UnkownFailure value, $Res Function(_$UnkownFailure) then) =
      __$$UnkownFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnkownFailureCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$UnkownFailureCopyWith<$Res> {
  __$$UnkownFailureCopyWithImpl(
      _$UnkownFailure _value, $Res Function(_$UnkownFailure) _then)
      : super(_value, (v) => _then(v as _$UnkownFailure));

  @override
  _$UnkownFailure get _value => super._value as _$UnkownFailure;
}

/// @nodoc

class _$UnkownFailure extends UnkownFailure {
  const _$UnkownFailure() : super._();

  @override
  String toString() {
    return 'Failure.unkownFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnkownFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverFailure,
    required TResult Function() dataParsingFailure,
    required TResult Function() connectionFailure,
    required TResult Function() unkownFailure,
  }) {
    return unkownFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
  }) {
    return unkownFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverFailure,
    TResult Function()? dataParsingFailure,
    TResult Function()? connectionFailure,
    TResult Function()? unkownFailure,
    required TResult orElse(),
  }) {
    if (unkownFailure != null) {
      return unkownFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(DataParsingFailure value) dataParsingFailure,
    required TResult Function(ConnectionFailure value) connectionFailure,
    required TResult Function(UnkownFailure value) unkownFailure,
  }) {
    return unkownFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
  }) {
    return unkownFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(DataParsingFailure value)? dataParsingFailure,
    TResult Function(ConnectionFailure value)? connectionFailure,
    TResult Function(UnkownFailure value)? unkownFailure,
    required TResult orElse(),
  }) {
    if (unkownFailure != null) {
      return unkownFailure(this);
    }
    return orElse();
  }
}

abstract class UnkownFailure extends Failure {
  const factory UnkownFailure() = _$UnkownFailure;
  const UnkownFailure._() : super._();
}
