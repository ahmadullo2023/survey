part of 'survey_bloc.dart';

@immutable
class SurveyState extends Equatable {
  final int pageIndex;
  final bool isSelect;
  final GetSurveyEntity surveyList;
  final FormzSubmissionStatus surveyStatus;



  const SurveyState({
    this.pageIndex = 1,
    this.isSelect = false,
    this.surveyList = const GetSurveyEntity(),
    this.surveyStatus = FormzSubmissionStatus.initial,

  });

  SurveyState copyWith({
    int? pageIndex,
    bool? isSelect,
    GetSurveyEntity? surveyList,
    FormzSubmissionStatus? surveyStatus,

  }) {
    return SurveyState(
      pageIndex: pageIndex ?? this.pageIndex,
      isSelect: isSelect ?? this.isSelect,
      surveyList: surveyList ?? this.surveyList,
      surveyStatus: surveyStatus ?? this.surveyStatus,

    );
  }

  List<Object?> get props => [
    pageIndex,
    isSelect,
    surveyList,
    surveyStatus,
  ];
}

