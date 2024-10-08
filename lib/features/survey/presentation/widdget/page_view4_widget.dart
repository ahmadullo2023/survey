import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView4 extends StatefulWidget {
  const PageView4({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView4> createState() => _PageView4State();
}

class _PageView4State extends State<PageView4> {
  int colorNum = -1;

  /// --- WIDGET ---

  Widget get textFirst => Text(widget.survey.questions[widget.index].question.toString(),
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      textAlign: TextAlign.center);

  Widget numberCard(index, SurveyState state) => Row(children: [
        GestureDetector(
            onTap: () {
              setState(() {
                colorNum = index;
                context.read<SurveyBloc>().add(IsSelect(isSelect: true));
              });
              context.read<SurveyBloc>().add(TemporaryAnsEvent(
                temporarySurId: state.surveyList.id,
                temporaryQueId: state.surveyList.questions[widget.index].id!,
                temporaryOptions: {
                  "answer": null,
                  "rate": index,
                  "options": const []
                },
              ));
            },
            child: Container(
                color: colorNum == index ? const Color(0xFFE8F0FE) : null,
                width: 36,
                child: Center(
                    child: Text("${index + 1}",
                        style: const TextStyle(color: Color(0xFFC6CFD7)))))),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: 1,
          decoration: BoxDecoration(
            color: const Color(0xFFC6CFD7),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ]);


  Widget numberListView(SurveyState state) => Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return numberCard(index, state);
            },
            itemCount: 10,
          ),
        ),
      );

  Widget numberSelect(SurveyState state) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFFF5F6F7),
          ),
          child: numberListView(state),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                textFirst,
                numberSelect(state),
              ],
            ));
  }
}
