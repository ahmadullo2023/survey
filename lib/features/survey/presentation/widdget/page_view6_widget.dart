import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView6 extends StatefulWidget {
  const PageView6({super.key});


  @override
  State<PageView6> createState() => _PageView6State();
}

class _PageView6State extends State<PageView6> {
  int selectedValue = 0;


  Widget radioCard(context) => GestureDetector(
    onTap: () {
      context.read<SurveyBloc>().add(IsSelect(isSelect: selectedValue == 0 ? true : false));
      },
    child: Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFE0E5E9),
        ),
        borderRadius: BorderRadius.circular(15.0)),
    child: ListTile(
      title: const Text('Option 1'),
      trailing: Radio(
        value: 1,
        groupValue: selectedValue,
        onChanged: (int? value) {
          setState(() {
            selectedValue = selectedValue == 0 ? 1 : 0;
            print(selectedValue);

          });
        },
      ),
    ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    context.read<SurveyBloc>().add(IsSelect(isSelect: true));

    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        //Text(widget.survey.questions[5].question.toString(),
        const Text("Как вы оцениваете качество нашего сервиса?6",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            textAlign: TextAlign.center),
        const SizedBox(height: 10),
        SizedBox(
          height: 430,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return radioCard(context);
              }
              ),
        ),
      ],
    );
  }
}
