part of 'card_state_bloc_bloc.dart';

abstract class CardStateBlocEvents {
  const CardStateBlocEvents();
}

class CardStateBlocEventToogle extends CardStateBlocEvents {
  final int index;
  CardStateBlocEventToogle(this.index);
}

class CardStateBlocEventAddNewCard extends CardStateBlocEvents {
  final CardModel cardModel;

  CardStateBlocEventAddNewCard(this.cardModel);
}

class CardStateBlocEventDeleteCard extends CardStateBlocEvents {
  final int index;

  CardStateBlocEventDeleteCard(this.index);
}

class CardStateBlocEventHomeScreenLoading extends CardStateBlocEvents {}
