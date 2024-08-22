part of 'survey_bloc.dart';

@immutable
abstract class SurveyEvent {}

class PageIndex extends SurveyEvent {
  final int pageIndex;
  PageIndex({required this.pageIndex});
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
  SurveyAnswerEvent({required this.surId, required this.queId});
}