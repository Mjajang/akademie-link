import 'package:akademiklink/models/student_model.dart';
import 'package:akademiklink/services/contact_list.dart';
import 'package:akademiklink/services/extracurricular_list.dart';
import 'package:akademiklink/services/syllabus_list.dart';
import '../services/teacher_list.dart';

List<Student> students = [
  Student(
    id: '1',
    name: 'Jajang Mahrul',
    studentId: '1806700001',
    className: 'XII Agama',
    imgUrl: 'assets/user.webp',
    teachers: teachers,
    syllabus: syllabusListSatu,
    contacts: contactsSatu,
    extraculicullars: extracurriculars,
  ),
  Student(
    id: '2',
    name: 'Azzario Razy',
    studentId: '1806700002',
    className: 'XII RPL',
    imgUrl: 'assets/user-1.webp',
    teachers: teachers,
    syllabus: syllabusListDua,
    contacts: contactsDua,
    extraculicullars: extracurriculars,
  ),
];
