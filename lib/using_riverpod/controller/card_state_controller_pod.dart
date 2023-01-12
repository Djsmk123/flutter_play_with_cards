import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_applications/models/card_model.dart';
import 'package:sample_applications/models/cards_list.dart';
import 'package:sample_applications/using_riverpod/states/card_states_riverpod.dart';

import '../../constant.dart';

class CardsController extends StateNotifier<CardStates> {
  CardsController()
      : super(CardStates(
          cardList: CardList.fromJson({
            "cards": cardsList(),
          }),
          cardStates: const CardStatesModel(false, null),
          isLoading: false,
        ));

  set setHomeScreenLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  //add new card

  Future addNewCard(CardModel card) async {
    setHomeScreenLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      cardList: state.cardList.copyWith([
        ...state.cardList.cards,
        card,
      ]),
    );
    setHomeScreenLoading = false;
  }

  setCardLoading(bool value, int? index) {
    state = state.copyWith(
      cardStates: CardStatesModel(value, index),
    );
  }

  //like updates
  Future toggleLike(int index) async {
    setCardLoading(true, index);
    await Future.delayed(const Duration(seconds: 1));
    if (state.cardList.cards[index].isLiked) {
      state = state.copyWith(
        cardList: state.cardList.copyWith([
          ...state.cardList.cards.sublist(0, index),
          state.cardList.cards[index].copyWith(
            isLiked: !state.cardList.cards[index].isLiked,
            likes: state.cardList.cards[index].likes - 1,
          ),
          ...state.cardList.cards.sublist(index + 1),
        ]),
      );
    } else {
      state = state.copyWith(
        cardList: state.cardList.copyWith([
          ...state.cardList.cards.sublist(0, index),
          state.cardList.cards[index].copyWith(
            isLiked: !state.cardList.cards[index].isLiked,
            likes: state.cardList.cards[index].isLiked
                ? state.cardList.cards[index].likes - 1
                : state.cardList.cards[index].likes + 1,
          ),
          ...state.cardList.cards.sublist(index + 1),
        ]),
      );
    }
    setCardLoading(false, null);
  }

  //remove card
  Future removeCard(int index) async {
    setHomeScreenLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      cardList: state.cardList.copyWith([
        ...state.cardList.cards.sublist(0, index),
        ...state.cardList.cards.sublist(index + 1),
      ]),
    );
    setHomeScreenLoading = false;
  }
}
