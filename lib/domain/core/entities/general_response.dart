import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_response.freezed.dart';

@freezed
class GeneralResponse with _$GeneralResponse {
  factory GeneralResponse({
    bool? status,
    String? message,
  }) = _GeneralResponse;
}
