import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

import '../bloc/survey_bloc.dart';

class PageView4 extends StatefulWidget {
  const PageView4({super.key});

  @override
  State<PageView4> createState() => _PageView4State();
}

class _PageView4State extends State<PageView4> {

  int colorNum = 0;


  /// --- WIDGET ---


  Widget get textFirst => const Text("Оцените, насколько вы довольны \n нашим приложением4",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
      textAlign: TextAlign.center);


  Widget numberCard(index) => Row(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
               colorNum = index;
                context.read<SurveyBloc>().add(IsSelect(isSelect: true));
              });
              },
            child: Container(
                  color: colorNum == index ? const Color(0xFFE8F0FE) : null,
                  width: 22,
                  child: Center(
                      child: Text("${index + 1}",
                          style: const TextStyle(
                              color: Color(0xFFC6CFD7)))))),
        const VerticalDivider(color: Color(0xFFC6CFD7), thickness: 1)
      ]);



  Widget get numberListView=> Padding(
    padding: const EdgeInsets.all(0),
    child: SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return numberCard(index);
        },
        itemCount: 10,
      ),
    ),
  );



  Widget get numberSelect => Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFF5F6F7),
      ),
      child: numberListView,
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
        numberSelect,
      ],
    ));
  }
}
