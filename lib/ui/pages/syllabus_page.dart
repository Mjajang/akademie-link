import 'package:akademiklink/models/syllabus_model.dart';
import 'package:akademiklink/models/topic_model.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SyllabusPage extends StatelessWidget {
  final List<Syllabus>? syllabusList;

  const SyllabusPage({
    super.key,
    required this.syllabusList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('Syllabus'),
      body: ListView.builder(
        itemCount: syllabusList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final Syllabus? syllabus = syllabusList?[index];

          if (syllabus != null) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: greyColor,
                collapsedBackgroundColor: whiteColor,
                textColor: blackColor,
                title: Text(
                  syllabus.title,
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(syllabus.subtitle),
                children: syllabus.topics.map<Widget>((Topic topic) {
                  return ListTile(
                    title: Text(
                      topic.name,
                      style: whiteTextStyle,
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
