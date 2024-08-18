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
  int index = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// --- WIDGET ---

  Widget continueWidget(state) => ElevatedButton(
        onPressed: () {
          state.pageIndex == 7
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SurveyThankPage()))
              : ();
          context.read<SurveyBloc>().add(PageIndex(pageIndex: state.isSelect == true ? state.pageIndex + 1 : state.pageIndex));
          context.read<SurveyBloc>().add(IsSelect(isSelect: false));
          controller.jumpToPage(state.pageIndex );
            },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(343, 44),
            backgroundColor: state.isSelect == false ? const Color(0xFFC6CFD7) : const Color(0xFF4489F7),
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
          child: colorName == null ? null : Center(child: Text("${state.pageIndex}/7")),
        ),
      );

  Widget appBarWidget(state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pageCounter(Color(0xFFF5F6F7), state),
          const Text("Ответьте на вопрос"),
          pageCounter(null, state),
        ],
      );

  Widget pageView(state) => SizedBox(
        height: 500,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: const [
            PageView1(),
            PageView2(),
            PageView3(),
            PageView4(),
            PageView5(),
            PageView6(),
            PageView7(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Опросник",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
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
            value: state.pageIndex / 7,
          ),
          pageView(state),
          const Spacer(),
          continueWidget(state),
          const SizedBox(height: 30),
        ],
      ),
      );
        }
    );
  }
}
