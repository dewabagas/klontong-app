// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralResponseDto _$GeneralResponseDtoFromJson(Map<String, dynamic> json) {
  return _GeneralResponseDto.fromJson(json);
}

/// @nodoc
mixin _$GeneralResponseDto {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this GeneralResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneralResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralResponseDtoCopyWith<GeneralResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseDtoCopyWith<$Res> {
  factory $GeneralResponseDtoCopyWith(
          GeneralResponseDto value, $Res Function(GeneralResponseDto) then) =
      _$GeneralResponseDtoCopyWithImpl<$Res, GeneralResponseDto>;
  @useResult
  $Res call({bool? status, String? message});
}

/// @nodoc
class _$GeneralResponseDtoCopyWithImpl<$Res, $Val extends GeneralResponseDto>
    implements $GeneralResponseDtoCopyWith<$Res> {
  _$GeneralResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralResponseDto
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
abstract class _$$GeneralResponseDtoImplCopyWith<$Res>
    implements $GeneralResponseDtoCopyWith<$Res> {
  factory _$$GeneralResponseDtoImplCopyWith(_$GeneralResponseDtoImpl value,
          $Res Function(_$GeneralResponseDtoImpl) then) =
      __$$GeneralResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message});
}

/// @nodoc
class __$$GeneralResponseDtoImplCopyWithImpl<$Res>
    extends _$GeneralResponseDtoCopyWithImpl<$Res, _$GeneralResponseDtoImpl>
    implements _$$GeneralResponseDtoImplCopyWith<$Res> {
  __$$GeneralResponseDtoImplCopyWithImpl(_$GeneralResponseDtoImpl _value,
      $Res Function(_$GeneralResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$GeneralResponseDtoImpl(
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
@JsonSerializable()
class _$GeneralResponseDtoImpl extends _GeneralResponseDto {
  const _$GeneralResponseDtoImpl({this.status, this.message}) : super._();

  factory _$GeneralResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralResponseDtoImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'GeneralResponseDto(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralResponseDtoImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of GeneralResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralResponseDtoImplCopyWith<_$GeneralResponseDtoImpl> get copyWith =>
      __$$GeneralResponseDtoImplCopyWithImpl<_$GeneralResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _GeneralResponseDto extends GeneralResponseDto {
  const factory _GeneralResponseDto(
      {final bool? status, final String? message}) = _$GeneralResponseDtoImpl;
  const _GeneralResponseDto._() : super._();

  factory _GeneralResponseDto.fromJson(Map<String, dynamic> json) =
      _$GeneralResponseDtoImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;

  /// Create a copy of GeneralResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralResponseDtoImplCopyWith<_$GeneralResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
