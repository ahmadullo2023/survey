import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/survey/presentation/bloc/survey_bloc.dart';
import 'features/survey/presentation/page/survey_first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyBloc(),
      child: const MaterialApp(
      home: SurveyPage(),
      )
    );
  }
}