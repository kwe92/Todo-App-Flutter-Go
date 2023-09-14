import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String id;

  @JsonKey(name: 'task_name')
  final String taskName;

  @JsonKey(name: 'task_details')
  final String taskDetails;

  @JsonKey(name: 'created_date')
  final String createdDate;

  const TaskModel({
    required this.id,
    required this.taskName,
    required this.taskDetails,
    required this.createdDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
