import 'package:equatable/equatable.dart';
import 'package:job_timer/models/constants/project_tasks_constants.dart';

class ProjectTask extends Equatable {
  final String? _uid;
  final String name;
  final int duration;
  final DateTime created;

  const ProjectTask({
    required this.name,
    required this.duration,
    required this.created,
    String? uid,
  }) : _uid = uid;

  String? get uid => _uid;

  @override
  List<Object?> get props => [
        name,
        duration,
        created,
      ];

  factory ProjectTask.fromMap({
    required Map<String, dynamic> map,
    required String uid,
  }) {
    return ProjectTask(
      uid: uid,
      name: map[ProjectTasksConstants.NAME],
      duration: map[ProjectTasksConstants.DURATION],
      created: DateTime.parse(map[ProjectTasksConstants.CREATED]),
    );
  }

  Map<String, dynamic> toMap({
    required String projectUid,
  }) {
    return {
      ProjectTasksConstants.NAME: name,
      ProjectTasksConstants.DURATION: duration,
      ProjectTasksConstants.PROJECT_UID: projectUid,
      ProjectTasksConstants.CREATED: created.toIso8601String(),
    };
  }
}
