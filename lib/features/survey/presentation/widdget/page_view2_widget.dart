import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView2 extends StatefulWidget {
  const PageView2({super.key, required this.survey});

  final GetSurveyEntity survey;

  @override
  State<PageView2> createState() => _PageView1State();
}

class _PageView1State extends State<PageView2> {
  int moodImaNum = 0;

  Widget gestureMood(assPath, number) => BlocBuilder<SurveyBloc, SurveyState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          setState(() {
            moodImaNum = number;
            context.read<SurveyBloc>().add(IsSelect(isSelect:  number == 0 ? false : true));
          });
        },
        child: SvgPicture.asset(assPath),
      ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Text(widget.survey.questions[1].question.toString(),
        //const Text("Оцените, насколько вы довольны \n нашим приложением1",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            moodImaNum >= 1
                ? gestureMood("assets/mood_emoge/EmojiLight.svg", 1)
                : gestureMood("assets/mood_emoge/Emoji.svg", 1),
            moodImaNum >= 2
                ? gestureMood("assets/mood_emoge/EmojiLight2.svg", 2)
                : gestureMood("assets/mood_emoge/Emoji2.svg", 2),
            moodImaNum >= 3
                ? gestureMood("assets/mood_emoge/EmojiLight3.svg", 3)
                : gestureMood("assets/mood_emoge/Emoji3.svg", 3),
            moodImaNum >= 4
                ? gestureMood("assets/mood_emoge/EmojiLight4.svg", 4)
                : gestureMood("assets/mood_emoge/Emoji4.svg", 4),
            moodImaNum >= 5
                ? gestureMood("assets/mood_emoge/EmojiLight5.svg", 5)
                : gestureMood("assets/mood_emoge/Emoji5.svg", 5),
          ],
        )
      ],
    );
  }
}
