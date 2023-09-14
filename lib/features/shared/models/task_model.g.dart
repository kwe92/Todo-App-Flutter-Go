// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      taskName: json['taskName'] as String,
      taskDetails: json['taskDetails'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'taskDetails': instance.taskDetails,
      'createdDate': instance.createdDate,
    };
