import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/card_model.dart';
import 'package:sample_applications/models/cards_list.dart';

part 'card_state_bloc_event.dart';
part 'card_state_bloc_state.dart';

class CardStateProviderBloc
    extends Bloc<CardStateBlocEvents, CardStateBlocState> {
  CardStateProviderBloc()
      : super(CardStateBloc(CardList.fromJson({"cards": cardsList()}),
            const CardStatesModel(false, null), false)) {
    on<CardStateBlocEvents>((event, emit) async {
      if (event is CardStateBlocEventAddNewCard) {
        emit(state.copyWith(isLoading: true));
        await Future.delayed(const Duration(seconds: 2));
        var cards = state.cardsList.copyWith(
          [
            ...state.cardsList.cards,
            event.cardModel,
          ],
        );
        emit(state.copyWith(cardsList: cards, isLoading: false));
      } else if (event is CardStateBlocEventDeleteCard) {
        emit(state.copyWith(isLoading: true));
        await Future.delayed(const Duration(seconds: 2));
        var cards = state.cardsList.cards;
        cards.removeAt(event.index);
        emit(state.copyWith(
          cardsList: state.cardsList.copyWith(cards),
          isLoading: false,
        ));
      } else if (event is CardStateBlocEventToggleLike) {
        emit(state.copyWith(
            cardStatesModel: CardStatesModel(true, event.index)));

        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(
            cardStatesModel: const CardStatesModel(false, null)));
        var card = state.cardsList.cards[event.index];

        if (card.isLiked) {
          card = card.copyWith(likes: card.likes - 1, isLiked: false);
        } else {
          card = card.copyWith(likes: card.likes + 1, isLiked: true);
        }
        var cards = state.cardsList.cards;
        cards[event.index] = card;
        emit(state.copyWith(
          cardsList: state.cardsList.copyWith(cards),
          isLoading: false,
        ));
      }
    });
  }
}
