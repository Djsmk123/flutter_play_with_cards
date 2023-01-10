import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/cards_list.dart';

class CardStates {
  final CardList cardList;
  final CardStatesModel cardStates;

  CardStates(
      {required this.cardList,
      this.isLoading = false,
      this.cardStates = const CardStatesModel(false, null)});

  final bool isLoading;

  CardStates copyWith({
    CardList? cardList,
    CardStatesModel? cardStates,
    bool? isLoading,
  }) =>
      CardStates(
        cardList: cardList ?? this.cardList,
        cardStates: cardStates ?? this.cardStates,
        isLoading: isLoading ?? this.isLoading,
      );
}
