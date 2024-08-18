part of 'survey_bloc.dart';

@immutable
class SurveyState extends Equatable {
  final int pageIndex;
  final bool isSelect;

  const SurveyState({
    this.pageIndex = 1,
    this.isSelect = false
  });

  SurveyState copyWith({
    int? pageIndex,
    bool? isSelect,
  }) {
    return SurveyState(
      pageIndex: pageIndex ?? this.pageIndex,
      isSelect: isSelect ?? this.isSelect,
    );
  }

  List<Object?> get props => [
    pageIndex,
    isSelect,
  ];
}

