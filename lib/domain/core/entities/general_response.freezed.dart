// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeneralResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralResponseCopyWith<GeneralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseCopyWith<$Res> {
  factory $GeneralResponseCopyWith(
          GeneralResponse value, $Res Function(GeneralResponse) then) =
      _$GeneralResponseCopyWithImpl<$Res, GeneralResponse>;
  @useResult
  $Res call({bool? status, String? message});
}

/// @nodoc
class _$GeneralResponseCopyWithImpl<$Res, $Val extends GeneralResponse>
    implements $GeneralResponseCopyWith<$Res> {
  _$GeneralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralResponseImplCopyWith<$Res>
    implements $GeneralResponseCopyWith<$Res> {
  factory _$$GeneralResponseImplCopyWith(_$GeneralResponseImpl value,
          $Res Function(_$GeneralResponseImpl) then) =
      __$$GeneralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message});
}

/// @nodoc
class __$$GeneralResponseImplCopyWithImpl<$Res>
    extends _$GeneralResponseCopyWithImpl<$Res, _$GeneralResponseImpl>
    implements _$$GeneralResponseImplCopyWith<$Res> {
  __$$GeneralResponseImplCopyWithImpl(
      _$GeneralResponseImpl _value, $Res Function(_$GeneralResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$GeneralResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeneralResponseImpl implements _GeneralResponse {
  _$GeneralResponseImpl({this.status, this.message});

  @override
  final bool? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'GeneralResponse(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralResponseImplCopyWith<_$GeneralResponseImpl> get copyWith =>
      __$$GeneralResponseImplCopyWithImpl<_$GeneralResponseImpl>(
          this, _$identity);
}

abstract class _GeneralResponse implements GeneralResponse {
  factory _GeneralResponse({final bool? status, final String? message}) =
      _$GeneralResponseImpl;

  @override
  bool? get status;
  @override
  String? get message;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralResponseImplCopyWith<_$GeneralResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
