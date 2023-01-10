part of 'card_state_bloc_bloc.dart';

@immutable
abstract class CardStateBlocState {}

class CardStateBlocInitial extends CardStateBlocState {
  final CardList cardList;

  CardStateBlocInitial(this.cardList);
}

class CardStateBlocLoading extends CardStateBlocState {
  final bool isLoading;

  CardStateBlocLoading(this.isLoading);
}

class CardStateBlocLoaded extends CardStateBlocState {
  final CardStatesModel cardStates;

  CardStateBlocLoaded(this.cardStates);
}

class CardStateBlocCardLst extends CardStateBlocState {
  final CardList cardList;

  CardStateBlocCardLst(this.cardList);
}
