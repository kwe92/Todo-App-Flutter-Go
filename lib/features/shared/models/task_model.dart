import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String id;
  final String taskName;
  final String taskDetails;
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
