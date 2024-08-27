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
  int selectedValue = 0;
  int? _selectedValue;

  /// --- WIDGETS ---

  Widget answerListTile(int index, SurveyState state) => ListTile(
        title: Text(widget.survey.questions[widget.index].options![index].choice
            .toString()),
        trailing: Radio(
          activeColor: Colors.blue,
          value: index,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              context.read<SurveyBloc>().add(IsSelect(isSelect: true));

              _selectedValue = value;

              context.read<SurveyBloc>().add(TemporaryAnsEvent(
                    temporarySurId: state.surveyList.id,
                    temporaryQueId:
                        state.surveyList.questions[widget.index].id!,
                    temporaryOptions: {
                      "answer": null,
                      "rate": null,
                      "options": [
                       "${state.surveyList.questions[widget.index].options![index].id}",
                      ]
                    },
                  ));
            });
          },
        ),
      );


  Widget answerCard(int index, SurveyState state) => Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFFE0E5E9),
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: answerListTile(index, state),
      );


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
