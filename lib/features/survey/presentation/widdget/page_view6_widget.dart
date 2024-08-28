import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView6 extends StatefulWidget {
  const PageView6({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView6> createState() => _PageView6State();
}

class _PageView6State extends State<PageView6> {
  int selectedValue = -1;

  /// --- WIDGETS ---

  Widget answerListTile(int index, SurveyState state, selectedValue) =>
      ListTile(
        title: Text(widget.survey.questions[widget.index].options![index].choice.toString()),
        trailing: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: selectedValue == index
                  ? const Color(0xFF4489F7)
                  : const Color(0xFFE0E5E9),
              width: 3,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: selectedValue == index
                  ? const Color(0xFF4489F7)
                  : Colors.white,
            ),
          ),
        ),
      );


  Widget answerCard(int index, SurveyState state) => GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = index;
          context.read<SurveyBloc>().add(IsSelect(isSelect: true));
        });

        context.read<SurveyBloc>().add(TemporaryAnsEvent(
              temporarySurId: state.surveyList.id,
              temporaryQueId: state.surveyList.questions[widget.index].id!,
              temporaryOptions: {
                "answer": null,
                "rate": null,
                "options": [
                  "${state.surveyList.questions[widget.index].options![index].id}",
                ]
              },
            ));
      },


      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:
                selectedValue == index ? Colors.blue : const Color(0xFFE0E5E9),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: answerListTile(index, state, selectedValue),
      ));

  Widget answerListView(SurveyState state) => SizedBox(
        height: 430,
        child: ListView.builder(
          itemCount: widget.survey.questions[widget.index].options!.length,
          itemBuilder: (context, index) {
            return answerCard(index, state);
          },
        ),
      );

  Widget get questionText => Text(widget.survey.questions[widget.index].question.toString(),
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      textAlign: TextAlign.center);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Column(
        children: <Widget>[
          const SizedBox(height: 10),
          questionText,
          const SizedBox(height: 10),
          answerListView(state),
        ],
      );
    });
  }
}
