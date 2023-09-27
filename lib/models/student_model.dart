import 'package:akademiklink/models/contact_model.dart';
import 'package:akademiklink/models/extraculicullar_model.dart';
import 'package:akademiklink/models/syllabus_model.dart';
import 'package:akademiklink/models/teacher_model.dart';

class Student {
  final String id;
  final String name;
  final String studentId;
  final String className;
  final String imgUrl;
  final List<Teacher>? teachers;
  final List<Syllabus>? syllabus;
  final List<Contact>? contacts;
  final List<ExtracurricularModel>? extraculicullars;

  Student({
    required this.id,
    required this.name,
    required this.studentId,
    required this.className,
    required this.imgUrl,
    this.teachers,
    this.syllabus,
    this.contacts,
    this.extraculicullars,
  });
}
