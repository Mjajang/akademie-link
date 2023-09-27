import 'package:akademiklink/models/topic_model.dart';

class Syllabus {
  final String title;
  final String subtitle;
  final List<Topic> topics;

  Syllabus({
    required this.title,
    required this.subtitle,
    required this.topics,
  });
}
