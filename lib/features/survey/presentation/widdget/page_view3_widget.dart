import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:survey/features/survey/presentation/widdget/page_view1_widget.dart';

import '../../domain/entities/survey_entities.dart';
import '../bloc/survey_bloc.dart';

class PageView3 extends StatefulWidget {
  const PageView3({super.key, required this.survey});

  final GetSurveyEntity survey;


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
          Text(widget.survey.questions[2].question.toString(),
          //const Text("Оцените, насколько вы довольны \n нашим приложением3",
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
                      child: GradientSlider(
                        thumbAsset: 'assets/icons/Frame.svg',
                        trackBorder: 0.5,
                        inactiveTrackColor: const Color(0xFFE0E5E9),
                        trackBorderColor: const Color(0xFFE0E5E9),
                        activeTrackGradient: const LinearGradient(colors: [
                          Color(0xFFFC6133),
                          Color(0xFFFD9459),
                          Color(0xFFF3C63E),
                          Color(0xFF73CF11),
                          Color(0xFF00B67A),
                        ]),
                        slider: Slider(
                            min: 0,
                            max: 100,
                            thumbColor: Colors.blue,
                            value: currentSliderValue,
                            onChanged: (value) {
                              setState(() {
                                currentSliderValue = value;
                                context.read<SurveyBloc>().add(IsSelect(
                                    isSelect: value == 0 ? false : true));
                                sliderCount = value.toInt();
                              });
                            }),
                      ))),
              Expanded(child: Text("${sliderCount ~/ 10}/10"))
            ],
          )
        ],
      ),
    );
  }
}
