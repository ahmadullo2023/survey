import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:survey/features/survey/presentation/page/survey_page.dart';

import '../bloc/survey_bloc.dart';


class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

/// ---  WIDGET  ---

Widget wButtons(BuildContext context, SurveyState state) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            print("HiHiHi${state.surveyList.title}");
            // context.read<SurveyBloc>().add(
            //   SurveyRejectEvent(id: state.surveyList.id),
            // );
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: const Size(166, 44),
              backgroundColor: const Color(0xFFF5F6F7),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              )),
          child: const Text("Отмена", style: TextStyle(color: Colors.black)),
        ),

        GradientElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Survey()));
          },
          style: GradientElevatedButton.styleFrom(
            fixedSize: const Size(166, 44),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            gradient: const LinearGradient(colors: [
              Color(0xFF73CF11),
              Color(0xFF00B67A),
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          child: const Text('Да', style: TextStyle(color: Colors.white)),
        ),
      ],
    );

Widget awardText(SurveyState state) => Padding(
    padding: const EdgeInsets.all(1),
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Text("${state.surveyList.title}",),
            const Text("Награда"),
            Container(
                width: 142,
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFEBF7F1),
                ),
                child: Center(
                    child: Text(
                    state.surveyList.price.toString(),
                  //"30 000 UZS",
                  style: const TextStyle(
                      color: Color(0xFF00B67A), fontWeight: FontWeight.w800),
                ))),
          ],
        )));


Widget award(SurveyState state) => Container(
    height: 91,
    width: 343,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFFEBF7F1),
    ),
    child: awardText(state));


class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) => Scaffold(
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
            award(state),
            const Spacer(),
            wButtons(context, state),
            const SizedBox(height: 40),
          ],
        ),
      ),
        ),
    );
  }
}
