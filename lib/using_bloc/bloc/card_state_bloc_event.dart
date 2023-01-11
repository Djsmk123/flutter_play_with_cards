part of 'card_state_bloc_bloc.dart';

abstract class CardStateBlocEvents {
  const CardStateBlocEvents();
}

class CardStateBlocEventToggleLike extends CardStateBlocEvents {
  final int index;
  CardStateBlocEventToggleLike(this.index);
}

class CardStateBlocEventAddNewCard extends CardStateBlocEvents {
  final CardModel cardModel;

  CardStateBlocEventAddNewCard(this.cardModel);
}

class CardStateBlocEventDeleteCard extends CardStateBlocEvents {
  final int index;

  CardStateBlocEventDeleteCard(this.index);
}
