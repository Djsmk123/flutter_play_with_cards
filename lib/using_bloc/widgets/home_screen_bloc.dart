import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_applications/constant.dart';

import 'package:sample_applications/using_bloc/bloc/card_state_bloc_bloc.dart';
import 'package:sample_applications/using_bloc/widgets/custom_card_bloc.dart';
import 'package:sample_applications/widgets/common_home_screen.dart';

class BlocHomeScreen extends StatelessWidget {
  const BlocHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardStateProviderBloc, CardStateBlocState>(
      builder: ((context, state) {
        return CommonHomeScreen(
            cardsList: state.cardsList,
            addCard: (title, desc) {
              BlocProvider.of<CardStateProviderBloc>(context)
                  .add(CardStateBlocEventAddNewCard(createCard(title, desc)));
            },
            removeCard: (index) {
              BlocProvider.of<CardStateProviderBloc>(context)
                  .add(CardStateBlocEventDeleteCard(index));
            },
            isLoading: state.isLoading,
            child: (index) {
              return CustomCardWidgetBloc(
                index: index,
              );
            },
            stateManement: 'Bloc');
      }),
    );
  }
}
