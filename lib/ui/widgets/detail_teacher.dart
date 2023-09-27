import 'package:akademiklink/models/teacher_model.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailTeacher extends StatelessWidget {
  final Teacher teacher;
  final String heroTag;

  const DetailTeacher({
    super.key,
    required this.teacher,
    required this.heroTag,
  });

  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Center(
              child: Hero(
                tag: heroTag,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          teacher.imgUrl,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          teacher.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SafeArea(child: BackButton()),
          ],
        ),
      );
}
