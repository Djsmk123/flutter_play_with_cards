// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/cards_list.dart';

part 'card_state_bloc_event.dart';
part 'card_state_bloc_state.dart';

class CardStateBlocBloc extends Bloc<CardStateBlocEvent, CardStateBlocState> {
  CardStateBlocBloc()
      : super(CardStateBlocInitial(
          CardList.fromJson({
            "cards": cards,
          }),
        )) {
    on<CardStateBlocEvent>((event, emit) async {
      if (event is CardStateBlocEventAddNewCard) {
        emit(CardStateBlocLoading(true));
        await Future.delayed(const Duration(seconds: 1));
      } else if (event is CardStateBlocEventSetCardLoading) {
        emit(CardStateBlocLoading(true));
      } else if (event is CardStateBlocEventToggleLike) {
        emit(CardStateBlocLoading(true));
      } else if (event is CardStateBlocEventRemoveCard) {
        emit(CardStateBlocLoading(true));
      } else if (event is CardStateBlocEventSetHomeScreenLoading) {
        emit(CardStateBlocLoading(true));
      }
    });
  }
}
