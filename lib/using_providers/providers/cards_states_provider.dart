import 'package:flutter/material.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/card_model.dart';
import 'package:sample_applications/models/card_state_model.dart';
import 'package:sample_applications/models/cards_list.dart';

class CardsStateProvider extends ChangeNotifier {
  CardList cardList = CardList.fromJson({
    "cards": cardsList(),
  });

  bool isLoading = false;

  CardStatesModel cardStates = const CardStatesModel(false, null);

  set setHomeScreenLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setCardLoading(bool value, int? index) {
    cardStates = CardStatesModel(value, index);
    notifyListeners();
  }

  Future<void> likeUpdates(int index) async {
    //mock loading
    setCardLoading(true, index);
    await Future.delayed(const Duration(seconds: 1));

    // copyWith is a method that we have created in the CardList model
    // it will return a new CardList object with the updated card
    if (cardList.cards[index].isLiked) {
      cardList = cardList.copyWith([
        ...cardList.cards.sublist(0, index),
        cardList.cards[index].copyWith(
          isLiked: !cardList.cards[index].isLiked,
          likes: cardList.cards[index].likes - 1,
        ),
        ...cardList.cards.sublist(index + 1),
      ]);
    } else {
      cardList = cardList.copyWith([
        ...cardList.cards.sublist(0, index),
        cardList.cards[index].copyWith(
          isLiked: !cardList.cards[index].isLiked,
          likes: cardList.cards[index].isLiked
              ? cardList.cards[index].likes - 1
              : cardList.cards[index].likes + 1,
        ),
        ...cardList.cards.sublist(index + 1),
      ]);
    }
    setCardLoading(false, null);
  }

  // add New card
  Future addCard(
    CardModel card,
  ) async {
    setHomeScreenLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    cardList = cardList.copyWith([
      ...cardList.cards,
      card,
    ]);
    setHomeScreenLoading = false;
  }

  //remove card
  void removeCard(CardModel card) {
    cardList = cardList.copyWith([
      ...cardList.cards.where((element) => element != card),
    ]);
    notifyListeners();
  }

  //update card
  Future updateCard(index, title, desc) async {
    setCardLoading(true, index);

    await Future.delayed(const Duration(seconds: 1));
    cardList = cardList.copyWith([
      ...cardList.cards.sublist(0, index),
      cardList.cards[index].copyWith(
        name: title,
        description: desc,
      ),
      ...cardList.cards.sublist(index + 1),
    ]);
    setCardLoading(false, null);
  }
}
