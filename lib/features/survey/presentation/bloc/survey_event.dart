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
  final int bookId;
  GetSurveyEvent({required this.bookId});
}


class SurveyRejectEvent extends SurveyEvent {
  final String id;
  SurveyRejectEvent({required this.id});
}