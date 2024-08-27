part of 'survey_bloc.dart';

@immutable
abstract class SurveyEvent {}

class PageIndexEvent extends SurveyEvent {
  final int pageIndex;

  PageIndexEvent({required this.pageIndex});
}

class IsSelect extends SurveyEvent {
  final bool isSelect;

  IsSelect({required this.isSelect});
}

class GetSurveyEvent extends SurveyEvent {
  GetSurveyEvent();
}

class SurveyRejectEvent extends SurveyEvent {
  final String id;

  SurveyRejectEvent({required this.id});
}

class SurveyAnswerEvent extends SurveyEvent {
  final String surId;
  final String queId;
  final Map<String, dynamic> optionsData;

  SurveyAnswerEvent(
      {required this.surId, required this.queId, required this.optionsData});
}


class SurveyFinishEvent extends SurveyEvent {
  final String surId;
  final String queId;
  final Map<String, dynamic> optionsData;

  SurveyFinishEvent(
      {required this.surId, required this.queId, required this.optionsData});
}




class TemporaryAnsEvent extends SurveyEvent {
  final String temporarySurId;
  final String temporaryQueId;
  final Map<String, dynamic> temporaryOptions;

  TemporaryAnsEvent({
    required this.temporarySurId,
    required this.temporaryQueId,
    required this.temporaryOptions
  });
}




