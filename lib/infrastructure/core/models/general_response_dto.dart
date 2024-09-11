import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:klontong_app/domain/core/entities/general_response.dart';

part 'general_response_dto.freezed.dart';

part 'general_response_dto.g.dart';

@freezed
class GeneralResponseDto with _$GeneralResponseDto {
  const GeneralResponseDto._();

  const factory GeneralResponseDto({
    bool? status,
    String? message,
  }) = _GeneralResponseDto;

  factory GeneralResponseDto.fromDomain(GeneralResponse? generalResponse) {
    return GeneralResponseDto(
      status: generalResponse?.status,
      message: generalResponse?.message,
    );
  }

  GeneralResponse toDomain() {
    return GeneralResponse(
      status: status,
      message: message,
    );
  }

  factory GeneralResponseDto.fromJson(Map<String, Object?> json) =>
      _$GeneralResponseDtoFromJson(json);

  static List<GeneralResponse> fromJsonList(List<dynamic> list) {
    List<GeneralResponse> result = [];

    if (list.isNotEmpty) {
      for (var object in list) {
        result.add(GeneralResponseDto.fromJson(object as Map<String, Object?>)
            .toDomain());
      }
    }
    return result;
  }
}
