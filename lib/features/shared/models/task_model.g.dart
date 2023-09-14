// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      taskName: json['task_name'] as String,
      taskDetails: json['task_details'] as String,
      createdDate: json['created_date'] as String,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'task_name': instance.taskName,
      'task_details': instance.taskDetails,
      'created_date': instance.createdDate,
    };
