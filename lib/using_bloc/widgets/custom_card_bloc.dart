import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_applications/using_bloc/bloc/card_state_bloc_bloc.dart';
import 'package:sample_applications/widgets/card_container.dart';

class CustomCardWidgetBloc extends StatelessWidget {
  final int index;
  const CustomCardWidgetBloc({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardStateProviderBloc, CardStateBlocState>(
        builder: (context, state) {
      final card = state.cardsList.cards[index];
      final isLoading = state.cardStatesModel.index != null &&
              state.cardStatesModel.index == index
          ? state.cardStatesModel.isLoading
          : false;
      return CardContainer(
        card: card,
        onTap: () async {
          BlocProvider.of<CardStateProviderBloc>(context)
              .add(CardStateBlocEventToggleLike(index));
        },
        onUpdate: (title, description) {
          BlocProvider.of<CardStateProviderBloc>(context)
              .add(CardStateBlocEventUpdateCard(index, title, description));
        },
        index: index,
        isLoading: isLoading,
      );
    });
  }
}
