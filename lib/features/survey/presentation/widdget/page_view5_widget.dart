import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView5 extends StatefulWidget {
  const PageView5({super.key, required this.survey, required this.index});

  final GetSurveyEntity survey;
  final int index;

  @override
  State<PageView5> createState() => _PageView5State();
}

class _PageView5State extends State<PageView5> {
  TextEditingController surveyTextController = TextEditingController();

  /// --- WIDGETS ---

  Widget get textQuestion =>
      Text(widget.survey.questions[widget.index].question.toString(),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          textAlign: TextAlign.center);

  Widget textFieldWidget(state) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 200,
          color: const Color(0xFFF5F6F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 6,
                controller: surveyTextController,
                onChanged: (textController) {
                  context.read<SurveyBloc>().add(IsSelect(
                      isSelect: textController.isEmpty ? false : true));

                  context.read<SurveyBloc>().add(TemporaryAnsEvent(
                        temporarySurId: state.surveyList.id,
                        temporaryQueId:
                            state.surveyList.questions[widget.index].id!,
                        temporaryOptions: {
                          "answer": surveyTextController.text,
                          "rate": null,
                          "options": const []
                        },
                      ));
                },
                decoration: const InputDecoration(
                  hintText: "Введите свой ответ",
                  fillColor: Color(0xFFF5F6F7),
                  filled: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                maxLength: 100,
              ),
            ],
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
          textQuestion,
          textFieldWidget(state),
        ],
      );
    });
  }
}
