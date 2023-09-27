import 'package:akademiklink/models/student_model.dart';
import 'package:akademiklink/shared/shared_methods.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/pages/extraculicullar_page.dart';
import 'package:akademiklink/ui/pages/syllabus_page.dart';
import 'package:akademiklink/ui/widgets/detail_student_menu.dart';
import 'package:akademiklink/ui/widgets/detail_teacher.dart';
import 'package:flutter/material.dart';

class DetailStudentPage extends StatelessWidget {
  final Student student;
  const DetailStudentPage({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          student.imgUrl,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 170,
                        child: Text(
                          student.name,
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        student.studentId,
                        style: blackTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: [
                      StudentMenu(
                        title: 'Syllabus',
                        iconMenu: Icons.book_rounded,
                        onTap: () {
                          if (student.syllabus != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SyllabusPage(
                                    syllabusList: student.syllabus!),
                              ),
                            );
                          } else {
                            showCustomSnackbar(context,
                                'Data syllabus tidak tersedia untuk siswa ini.');
                          }
                        },
                      ),
                      StudentMenu(
                        title: 'Attendance',
                        iconMenu: Icons.fact_check_rounded,
                        onTap: () {},
                      ),
                      StudentMenu(
                        title: 'Home Work',
                        iconMenu: Icons.bookmark_add_rounded,
                        onTap: () {},
                      ),
                      StudentMenu(
                        title: 'Extracurricular',
                        iconMenu: Icons.sports_volleyball_rounded,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExtracurricularPage(
                                        extracurricular:
                                            student.extraculicullars!,
                                      )));
                        },
                      ),
                      StudentMenu(
                        title: 'Result',
                        iconMenu: Icons.find_in_page_rounded,
                        onTap: () {},
                      ),
                      StudentMenu(
                        title: 'Payment',
                        iconMenu: Icons.payment_rounded,
                        onTap: () {},
                      ),
                      StudentMenu(
                        title: 'Contact',
                        iconMenu: Icons.contact_emergency_rounded,
                        onTap: () {
                          _detailStudentContact(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Text(
                "Teachers",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: student.teachers!.map(
                    (teacher) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailTeacher(
                              teacher: teacher,
                              heroTag:
                                  'teacher_${student.teachers!.indexOf(teacher)}',
                            ),
                          ),
                        ),
                        child: Hero(
                          tag: 'teacher_${student.teachers!.indexOf(teacher)}',
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  teacher.imgUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _detailStudentContact(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * 0.40
            : MediaQuery.of(context).size.height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: student.contacts!
                .map(
                  (contact) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          contact.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        subtitle: Text(
                          contact.noTelp,
                          style: greyTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call_made_rounded,
                              color: blackColor,
                            )),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
