import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey/features/survey/presentation/page/survey_page.dart';


class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

/// ---  WIDGET  ---

Widget wButtons(context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(166, 44),
              backgroundColor: const Color(0xFFF5F6F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: const Text("Отмена"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Survey()));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(166, 44),
              backgroundColor: const Color(0xFF73CF11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: const Text('Да'),
        ),
      ],
    );

Widget get awardText => Padding(
    padding: const EdgeInsets.all(1),
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Награда"),
            Container(
                width: 142,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFEBF7F1),
                ),
                child: const Center(
                    child: Text(
                  "30 000 UZS",
                  style: TextStyle(
                      color: Color(0xFF00B67A), fontWeight: FontWeight.w800),
                ))),
          ],
        )));

Widget get award => Container(
    height: 91,
    width: 343,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFFEBF7F1),
    ),
    child: awardText);

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            SvgPicture.asset("assets/icons/Frame.svg"),
            const Text(
              "Будем рады за отдачу 🤗",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const Text(
                "Пройдите ещё один опросник и внесите вклад в улучшение наших услуг",
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            award,
            const Spacer(),
            wButtons(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
