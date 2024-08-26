import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/formz.dart';
import '../../domain/entities/survey_entities.dart';
import '../../domain/usecase/answer_usecase.dart';
import '../../domain/usecase/reject_usecase.dart';
import '../../domain/usecase/survey_usecase.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final GetSurveyListUseCase getSurveyUseCase = GetSurveyListUseCase();
  final RejectSurveyUseCase rejectSurveyUseCase = RejectSurveyUseCase();
  final AnswerSurveyUseCase answerSurveyUseCase = AnswerSurveyUseCase();

  SurveyBloc() : super(const SurveyState()) {
    on<PageIndexEvent>(_pageIndex);
    on<IsSelect>(_isSelect);
    on<GetSurveyEvent>(_getSurveyList);
    on<SurveyRejectEvent>(_surveyReject);
    on<SurveyAnswerEvent>(_surveyAnswer);
    on<TemporaryAnsEvent>(_temporaryAns);
  }


  void _pageIndex(PageIndexEvent event, Emitter<SurveyState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }


  void _isSelect(IsSelect event, Emitter<SurveyState> emit) {
    emit(state.copyWith(isSelect: event.isSelect));
  }


  Future<void> _getSurveyList(GetSurveyEvent event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(surveyStatus: FormzSubmissionStatus.inProgress));
    final result = await getSurveyUseCase.call(NoParams());
    result.fold(
      (error) {
        emit(state.copyWith(surveyStatus: FormzSubmissionStatus.failure));
      },
      (result) {
        emit(
          state.copyWith(surveyStatus: FormzSubmissionStatus.success, surveyList: result,
          ));
      },
    );
  }


  Future<void> _surveyReject(
      SurveyRejectEvent event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(surveyStatus: FormzSubmissionStatus.inProgress));
    final result = await rejectSurveyUseCase.call(event.id);
    result.fold((error) {
      emit(state.copyWith(surveyStatus: FormzSubmissionStatus.failure));
    }, (result) {
      emit(state.copyWith(surveyStatus: FormzSubmissionStatus.success));
    });
  }


  Future<void> _surveyAnswer(
      SurveyAnswerEvent event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(surveyStatus: FormzSubmissionStatus.inProgress));
    final result = await answerSurveyUseCase.call(AnswerSurveyParams(
        surId: event.surId, queId: event.queId, optionsData: event.optionsData));
    result.fold((error) {
      emit(state.copyWith(surveyStatus: FormzSubmissionStatus.failure));
    }, (result) {
      emit(state.copyWith(surveyStatus: FormzSubmissionStatus.success));
    });
  }


  Future<void> _temporaryAns(TemporaryAnsEvent event, Emitter<SurveyState> emit) async {
    emit(state.copyWith(temporaryStatus: [
      event.temporarySurId,
      event.temporaryQueId,
      event.temporaryOptions,
    ]));
  }


}
