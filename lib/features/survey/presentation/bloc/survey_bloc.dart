import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {

  SurveyBloc() : super(const SurveyState()) {
    on<PageIndex>(_pageIndex);
    on<IsSelect>(_isSelect);
  }

  void _pageIndex(PageIndex event, Emitter<SurveyState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  void _isSelect(IsSelect event, Emitter<SurveyState> emit) {
    emit(state.copyWith(isSelect: event.isSelect));
  }

}