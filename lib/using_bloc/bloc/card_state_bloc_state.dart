part of 'card_state_bloc_bloc.dart';

@immutable
abstract class CardStateBlocState {
  final CardList cardsList;
  final CardStatesModel cardStatesModel;
  final bool isLoading;
  const CardStateBlocState(
      this.cardsList, this.cardStatesModel, this.isLoading);

  CardStateBloc copyWith(
      {CardList? cardsList,
      CardStatesModel? cardStatesModel,
      bool? isLoading}) {
    return CardStateBloc(cardsList ?? this.cardsList,
        cardStatesModel ?? this.cardStatesModel, isLoading ?? this.isLoading);
  }
}

class CardStateBloc extends CardStateBlocState {
  const CardStateBloc(
      CardList cardsList, CardStatesModel cardStatesModel, bool isLoading)
      : super(cardsList, cardStatesModel, isLoading);
}
