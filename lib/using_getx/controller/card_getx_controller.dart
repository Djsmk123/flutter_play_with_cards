import 'package:get/get.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/card_model.dart';
import 'package:sample_applications/models/cards_list.dart';

class CardControllerGetx extends GetxController {
  late final Rx<CardList> list = CardList.fromJson({"cards": cards}).obs;
  Rx<bool> isLoading = false.obs;
  Rx<CardStatesModel> cardStates = const CardStatesModel(false, null).obs;

  void updateCardStates(bool value, int? index) {
    cardStates.value =
        cardStates.value.copyWith(isLoading: value, index: index);
  }

  set setHomeScreenLoading(bool value) {
    isLoading.value = value;
  }

  // add card
  Future addCard(CardModel card) async {
    setHomeScreenLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    list.value.cards.add(card);
    setHomeScreenLoading = false;
  }
  //remove card

  Future removeCard(int index) async {
    setHomeScreenLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    list.value.cards.removeAt(index);
    setHomeScreenLoading = false;
  }

  //toggle like
  Future toggleLike(int index) async {
    updateCardStates(true, index);
    await Future.delayed(const Duration(seconds: 2));
    if (list.value.cards[index].isLiked) {
      list.update((val) {
        val!.cards[index] = val.cards[index].copyWith(
          isLiked: !val.cards[index].isLiked,
          likes: val.cards[index].likes - 1,
        );
      });
    } else {
      list.update((val) {
        val!.cards[index] = val.cards[index].copyWith(
          isLiked: !val.cards[index].isLiked,
          likes: val.cards[index].likes + 1,
        );
      });
    }
    updateCardStates(false, null);
  }
}
