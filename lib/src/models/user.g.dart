// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['id'] as String,
      json['is_bot'] as bool,
      json['first_name'] as String,
      json['username'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'is_bot': instance.isBot,
      'first_name': instance.firstname,
      'username': instance.username,
    };
