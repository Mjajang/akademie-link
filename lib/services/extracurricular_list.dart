import 'package:akademiklink/models/extraculicullar_model.dart';
import 'package:akademiklink/services/member_extracurriculer_list.dart';
import 'package:akademiklink/services/project_user_list.dart';

final List<ExtracurricularModel> extracurriculars = [
  ExtracurricularModel(
    title: 'English Club',
    lectureName: 'Ms. Anna',
    imageUrl:
        'https://images.unsplash.com/photo-1581726690015-c9861fa5057f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2785&q=80',
    members: 100,
    projects: 10,
    member_user: members,
    project_user: projects_user,
  ),
  ExtracurricularModel(
    title: 'Mobile Programming',
    lectureName: 'Mr. Jajang',
    imageUrl:
        'https://images.unsplash.com/photo-1631624220291-8f191fbdb543?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80',
    members: 40,
    projects: 10,
    member_user: members,
    project_user: projects_user,
  ),
];
