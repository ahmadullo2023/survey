import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/error.dart';
import '../../../../core/singletons/dio_settings.dart';
import '../../../../core/singletons/service_locator.dart';
import '../model/survey_info_model.dart';

part 'data_source_impl.dart';

abstract class SurveyDataSource {
  Future<SurveyInfoModel> getSurveyList();

  Future<void> postRejectSurvey({required String id});

  Future<void> postSurveyAnswer({
    required String surId,
      required String queId,
      required Map<String, dynamic> optionsData});

 Future<void> postSurveyFinish({
      required String surId,
      required String queId,
      required Map<String, dynamic> optionsData});
}

