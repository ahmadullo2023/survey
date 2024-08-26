import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView2 extends StatefulWidget {
  const PageView2({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView2> createState() => _PageView1State();
}

class _PageView1State extends State<PageView2> {
  int moodImaNum = 0;

  /// --- WIDGETS ---

  Widget gestureMood(assPath, number) => BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) => GestureDetector(
          onTap: () {
            setState(() {
              moodImaNum = number;
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
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(assPath),
          ),
        ),
      );


  Widget get textQuestion => Text(
      widget.survey.questions[widget.index].question.toString(),
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      textAlign: TextAlign.center);


  Widget get emojisButtons =>  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      moodImaNum >= 1
          ? gestureMood("assets/mood_emoge/EmojiLight1.png", 1)
          : gestureMood("assets/mood_emoge/Emoji1.png", 1),
      moodImaNum >= 2
          ? gestureMood("assets/mood_emoge/EmojiLight2.png", 2)
          : gestureMood("assets/mood_emoge/Emoji2.png", 2),
      moodImaNum >= 3
          ? gestureMood("assets/mood_emoge/EmojiLight3.png", 3)
          : gestureMood("assets/mood_emoge/Emoji3.png", 3),
      moodImaNum >= 4
          ? gestureMood("assets/mood_emoge/EmojiLight4.png", 4)
          : gestureMood("assets/mood_emoge/Emoji4.png", 4),
      moodImaNum >= 5
          ? gestureMood("assets/mood_emoge/EmojiLight5.png", 5)
          : gestureMood("assets/mood_emoge/Emoji5.png", 5),
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
        emojisButtons
      ],
    );
  }
}
