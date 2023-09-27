import 'package:akademiklink/models/member_extracurriculer_model.dart';
import 'package:akademiklink/models/project_model.dart';

class ExtracurricularModel {
  final String title;
  final String lectureName;
  final String imageUrl;
  final int members;
  final int projects;
  final List<MemberExtracurriculerModel>? member_user;
  final List<ProjectModel>? project_user;

  ExtracurricularModel({
    required this.title,
    required this.lectureName,
    required this.imageUrl,
    required this.members,
    required this.projects,
    this.member_user,
    this.project_user,
  });
}
