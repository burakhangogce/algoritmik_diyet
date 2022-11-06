import 'package:json_annotation/json_annotation.dart';
part 'event_output_model.g.dart';

@JsonSerializable()
class EventOutputModel {
  bool eventSuccess;
  String? eventState;
  List<String>? eventErrors;

  EventOutputModel(
      {required this.eventSuccess, this.eventState, this.eventErrors});

  factory EventOutputModel.fromJson(Map<String, dynamic> json) =>
      _$EventOutputModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventOutputModelToJson(this);
}
