import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

import '../bloc/survey_bloc.dart';

class PageView3 extends StatefulWidget {
  const PageView3({super.key});

  @override
  State<PageView3> createState() => _PageView3State();
}

class _PageView3State extends State<PageView3> {
  double currentSliderValue = 0;
  int sliderCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text("Оцените, насколько вы довольны \n нашим приложением3",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            textAlign: TextAlign.center),
        Row(
          children: [
            Expanded(
                flex: 7,
               child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 7,
                  ),
                 child: Slider(
                   min: 0,
                   max: 100,
                   activeColor: Colors.cyanAccent,
                   thumbColor: Colors.blue,
                   value: currentSliderValue,
                   onChanged: (value) {
                     setState(() {
                       currentSliderValue = value;
                       context.read<SurveyBloc>().add(IsSelect(isSelect: value == 0 ? false : true));
                       sliderCount = value.toInt();
                     });
                   },
                 ),
                )
            ),
            Expanded(child: Text("${sliderCount ~/ 10}/10"))
          ],
        )
      ],
        ),
    );
  }
}
