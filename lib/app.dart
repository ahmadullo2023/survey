import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/survey/presentation/bloc/survey_bloc.dart';
import 'features/survey/presentation/page/first_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SurveyBloc(),
        child: MaterialApp(
          home: const FirstPage(),
          navigatorKey: rootNavigatorKey,
        ));
  }
}






