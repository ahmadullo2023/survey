import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView1 extends StatefulWidget {
  const PageView1({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  int moodIconNum = 0;

  /// --- WIDGETS ---

  Widget gestureMood(assPath, number) => BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) => GestureDetector(
          onTap: () {
            setState(() {
              moodIconNum = number;
              context
                  .read<SurveyBloc>()
                  .add(IsSelect(isSelect: number == 0 ? false : true));
            });
            context.read<SurveyBloc>().add(TemporaryAnsEvent(
              temporarySurId: state.surveyList.id,
              temporaryQueId: state.surveyList.questions[widget.index].id!,
              temporaryOptions: {
                "answer": null,
                "rate": number,
                "options": const []
              },
            ));
          },
          child: SvgPicture.asset(assPath),
        ),
      );

  Widget get textQuestion => Text(widget.survey.questions[widget.index].question??"",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          textAlign: TextAlign.center);

  Widget get startsButtons => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      moodIconNum >= 1
          ? gestureMood("assets/mood_icon/StarsLight.svg", 1)
          : gestureMood("assets/mood_icon/Stars.svg", 1),
      moodIconNum >= 2
          ? gestureMood("assets/mood_icon/StarsLight2.svg", 2)
          : gestureMood("assets/mood_icon/Stars2.svg", 2),
      moodIconNum >= 3
          ? gestureMood("assets/mood_icon/StarsLight3.svg", 3)
          : gestureMood("assets/mood_icon/Stars3.svg", 3),
      moodIconNum >= 4
          ? gestureMood("assets/mood_icon/StarsLight4.svg", 4)
          : gestureMood("assets/mood_icon/Stars4.svg", 4),
      moodIconNum >= 5
          ? gestureMood("assets/mood_icon/StarsLight5.svg", 5)
          : gestureMood("assets/mood_icon/Stars5.svg", 5),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        textQuestion,
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: startsButtons,
        )
      ],
    );
  }
}
