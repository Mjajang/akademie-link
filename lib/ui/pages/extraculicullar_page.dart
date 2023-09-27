import 'package:akademiklink/models/extraculicullar_model.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/pages/extracurriculer_detail_page.dart';
import 'package:akademiklink/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExtracurricularPage extends StatefulWidget {
  final List<ExtracurricularModel> extracurricular;
  const ExtracurricularPage({
    super.key,
    required this.extracurricular,
  });

  @override
  State<ExtracurricularPage> createState() => _ExtracurricularPageState();
}

class _ExtracurricularPageState extends State<ExtracurricularPage> {
  final controller = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('Extracurricular'),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height - 120
                        : MediaQuery.of(context).size.height - 170,
                child: PageView.builder(
                  controller: controller,
                  itemCount: widget.extracurricular.length,
                  itemBuilder: (context, index) {
                    final extracurricular = widget.extracurricular[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          ExtracurricularCard(extracurricular: extracurricular),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: widget.extracurricular.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: secondaryColor,
                      dotHeight: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExtracurricularCard extends StatelessWidget {
  final ExtracurricularModel extracurricular;

  const ExtracurricularCard({
    super.key,
    required this.extracurricular,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExtracurricularDetailPage(
              extracurricular: extracurricular,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ).createShader(
                  Rect.fromLTRB(0, -140, rect.width, rect.height - 20),
                );
              },
              blendMode: BlendMode.darken,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(extracurricular.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Text(
              extracurricular.title,
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 28,
              ),
            ),
          ),
          Positioned(
            bottom: 38,
            left: 20,
            child: Row(
              children: [
                Text(
                  "Lecture ",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  extracurricular.lectureName,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: greyColor,
              ),
              child: Row(
                children: [
                  const Icon(Icons.groups_rounded),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    extracurricular.members.toString(),
                    style: blackTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
