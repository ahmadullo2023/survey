import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey/features/survey/presentation/page/survey_thank.dart';
import '../bloc/survey_bloc.dart';
import '../widdget/page_view2_widget.dart';
import '../widdget/page_view3_widget.dart';
import '../widdget/page_view4_widget.dart';
import '../widdget/page_view5_widget.dart';
import '../widdget/page_view6_widget.dart';
import '../widdget/page_view7_widget.dart';
import '../widdget/page_view1_widget.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// --- WIDGET ---


  Widget continueWidget(BuildContext context, SurveyState state) =>
      ElevatedButton(
        onPressed: () {
          if (state.pageIndex == state.surveyList.questions.length - 1 &&
              state.isSelect == true) {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SurveyThankPage()));
          } else {
            ();
          }
          context.read<SurveyBloc>().add(PageIndexEvent(
              pageIndex: state.isSelect == true
                  ? state.pageIndex + 1
                  : state.pageIndex));
          context.read<SurveyBloc>().add(IsSelect(isSelect: false));
          controller.jumpToPage(
              state.isSelect == false ? state.pageIndex : state.pageIndex + 1);

          context.read<SurveyBloc>().add(
                SurveyAnswerEvent(
                  surId: state.temporaryStatus[0],
                  queId: state.temporaryStatus[1],
                  optionsData: state.temporaryStatus[2],
                ),
              );
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(343, 44),
            backgroundColor: state.isSelect == false
                ? const Color(0xFFC6CFD7)
                : const Color(0xFF4489F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        child: const Text('Продолжить', style: TextStyle(color: Colors.white)),
      );


  Widget pageCounter(colorName, state) => Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 26,
          width: 42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: colorName),
          child: colorName == null
              ? null
              : Center(
                  child: Text(
                      "${state.pageIndex + 1}/${state.surveyList.questions.length}")),
        ),
      );


  Widget appBarWidget(state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pageCounter(const Color(0xFFF5F6F7), state),
          const Text("Ответьте на вопрос"),
          pageCounter(null, state),
        ],
      );


  PageView pageView(SurveyState state) => PageView.builder(
        itemCount: state.surveyList.questions.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (context, int index) {
          if (state.surveyList.questions[index].type == 'scale_rating' &&
              state.surveyList.questions[index].optionType == "stars") {
            return PageView1(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type == 'scale_rating' &&
              state.surveyList.questions[index].optionType == "emoji") {
            return PageView2(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type == 'scale_rating' &&
              state.surveyList.questions[index].optionType == "slider") {
            return PageView3(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type == 'scale_rating' &&
              state.surveyList.questions[index].optionType == "number") {
            return PageView4(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type == 'text') {
            return PageView5(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type ==
              'single_choice') {
            return PageView6(
              survey: state.surveyList,
              index: index,
            );
          } else if (state.surveyList.questions[index].type ==
              'multiple_choices') {
            return PageView7(
              survey: state.surveyList,
              index: index,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      );


  AppBar widgetAppBar(SurveyState state) => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Опросник",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SurveyBloc>().add(
                    SurveyAnswerEvent(
                      surId: state.temporaryStatus[0],
                      queId: state.temporaryStatus[1],
                      optionsData: state.temporaryStatus[2],
                    ),
                  );
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
          ),
        ],
      );




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: widgetAppBar(state),
        body: Column(
          children: [
            const Divider(
              thickness: 1,
              color: Color(0xFFE8F0FE),
            ),
            appBarWidget(state),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: Colors.blue[100],
              color: Colors.blue,
              value: state.pageIndex / (state.surveyList.questions.length),
            ),
            SizedBox(height: 550, child: pageView(state)),
            const Spacer(),
            continueWidget(context, state),
            const SizedBox(height: 30),
          ],
        ),
      );
    });
  }
}
