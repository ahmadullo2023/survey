import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView7 extends StatefulWidget {
  const PageView7({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView7> createState() => _PageView7State();
}

class _PageView7State extends State<PageView7> {
  bool isChecked = false;
  int isCheek = 0;


  List<bool> _selected = [false, false, false, false];
  bool value1 = false;


  Widget cheekBoxCard(optionIndex, SurveyState state) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: GestureDetector(
    onTap: (){
      setState(() {
        value1 = !value1;
        _selected[optionIndex] = value1;
      });
      context.read<SurveyBloc>().add(
          IsSelect(isSelect: _selected.contains(true) ? true : false));
    },
    child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: _selected[optionIndex] == true
                  ? const Color(0xFF4489F7)
                  : const Color(0xFFE0E5E9),
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          title: Text(widget.survey.questions[widget.index].options![optionIndex].choice.toString()),
          trailing: Checkbox(
            activeColor: Colors.blue,
            value: _selected[optionIndex], // isChecked,
            onChanged: (value) {
              setState(() {
                _selected[optionIndex] = value!;
              });
              context.read<SurveyBloc>().add(
                  IsSelect(isSelect: _selected.contains(true) ? true : false));

              context.read<SurveyBloc>().add(TemporaryAnsEvent(
                    temporarySurId: state.surveyList.id,
                    temporaryQueId: state.surveyList.questions[widget.index].id!,
                    temporaryOptions: {
                      "answer": null,
                      "rate": null,
                      "options": [
                      "${state.surveyList.questions[widget.index].options![optionIndex].id}",
                      ]
                    },
                  ));
              },
            ),
          ),
        ),
      ),
      );


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(widget.survey.questions[widget.index].question.toString(),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              textAlign: TextAlign.center),
          const SizedBox(height: 10),
          SizedBox(
            height: 430,
            child: ListView.builder(
                itemCount: widget.survey.questions[widget.index].options!.length,
                itemBuilder: (context, optionIndex) {
                  return cheekBoxCard(optionIndex, state);
                }),
          ),
        ],
      );
    });
  }
}
