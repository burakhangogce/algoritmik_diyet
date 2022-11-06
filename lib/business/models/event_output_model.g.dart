// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventOutputModel _$EventOutputModelFromJson(Map<String, dynamic> json) =>
    EventOutputModel(
      eventSuccess: json['eventSuccess'] as bool,
      eventState: json['eventState'] as String?,
      eventErrors: (json['eventErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EventOutputModelToJson(EventOutputModel instance) =>
    <String, dynamic>{
      'eventSuccess': instance.eventSuccess,
      'eventState': instance.eventState,
      'eventErrors': instance.eventErrors,
    };
