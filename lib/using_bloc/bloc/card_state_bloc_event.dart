part of 'card_state_bloc_bloc.dart';

@immutable
abstract class CardStateBlocEvent {}

class CardStateBlocInitialEvent extends CardStateBlocEvent {

}

class CardStateBlocEventAddNewCard extends CardStateBlocEvent {}

class CardStateBlocEventSetCardLoading extends CardStateBlocEvent {}

class CardStateBlocEventToggleLike extends CardStateBlocEvent {}

class CardStateBlocEventRemoveCard extends CardStateBlocEvent {}

class CardStateBlocEventSetHomeScreenLoading extends CardStateBlocEvent {}
