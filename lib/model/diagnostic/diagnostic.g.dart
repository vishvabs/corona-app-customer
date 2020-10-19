// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) {
  return Diagnostic(
    json['status'] as int,
    json['message'] as String,
    json['unix_timestam'] as int,
  );
}

Map<String, dynamic> _$DiagnosticToJson(Diagnostic instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'unix_timestam': instance.unixTimestamp,
    };
