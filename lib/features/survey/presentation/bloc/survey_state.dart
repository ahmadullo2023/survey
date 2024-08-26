part of 'survey_bloc.dart';

@immutable
class SurveyState extends Equatable {
  final int pageIndex;
  final bool isSelect;
  final GetSurveyEntity surveyList;
  final FormzSubmissionStatus surveyStatus;
  final List temporaryStatus;

  const SurveyState({
    this.pageIndex = 0,
    this.isSelect = false,
    this.surveyList = const GetSurveyEntity(),
    this.surveyStatus = FormzSubmissionStatus.initial,
    this.temporaryStatus = const [],
  });

  SurveyState copyWith({
    int? pageIndex,
    bool? isSelect,
    GetSurveyEntity? surveyList,
    FormzSubmissionStatus? surveyStatus,
    List? temporaryStatus,
  }) {
    return SurveyState(
      pageIndex: pageIndex ?? this.pageIndex,
      isSelect: isSelect ?? this.isSelect,
      surveyList: surveyList ?? this.surveyList,
      surveyStatus: surveyStatus ?? this.surveyStatus,
      temporaryStatus: temporaryStatus ?? this.temporaryStatus,
    );
  }

  @override
  List<Object?> get props =>
      [pageIndex, isSelect, surveyList, surveyStatus, temporaryStatus];
}
