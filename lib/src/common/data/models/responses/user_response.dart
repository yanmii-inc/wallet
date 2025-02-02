// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

/// Raw object representation the schema retrieved from server
@freezed
class UserResponse with _$UserResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserResponse({
    required String uid,
    required String email,
    required String token,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
