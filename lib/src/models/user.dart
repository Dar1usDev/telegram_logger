import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Telegram User dto
@JsonSerializable()
class UserDto {
  final String id;
  @JsonKey(name: 'is_bot')
  final bool isBot;
  @JsonKey(name: 'first_name')
  final String firstname;
  final String? username;

  UserDto(
    this.id,
    this.isBot,
    this.firstname,
    this.username,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  String toString() => toJson().toString();
}
