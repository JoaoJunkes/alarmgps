import 'package:json_annotation/json_annotation.dart';

part 'alarm_model.g.dart';

@JsonSerializable()
class AlarmDTO {
  AlarmDTO({
    this.description, this.distance
  });

  final String description;
  final String distance;

  factory  AlarmDTO.fromJson(Map<String, dynamic> json) => _$AlarmDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmDTOToJson(this);
}
