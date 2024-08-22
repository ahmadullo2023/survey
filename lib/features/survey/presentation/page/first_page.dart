import 'package:flutter/material.dart';
import 'package:survey/features/survey/presentation/page/survey_request_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (_) => const SurveyRequest(),
                ));
          },
          child: Text("START"),
        )));
  }
}
