import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_applications/common_home_screen.dart';
import 'package:sample_applications/constant.dart';

import 'package:sample_applications/using_providers/providers/cards_states_provider.dart';
import 'package:sample_applications/using_providers/widgets/custom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardsProvider = Provider.of<CardsStateProvider>(context);
    final cardList = cardsProvider.cardList;
    final bool isLoading = cardsProvider.isLoading;
    return CommonHomeScreen(
        cardsList: cardList,
        addCard: () {
          context.read<CardsStateProvider>().addCard(
                createCard(cardList.cards.length),
              );
        },
        removeCard: (index) {
          context.read<CardsStateProvider>().removeCard(cardList.cards[index]);
        },
        isLoading: isLoading,
        stateManement: 'Provider',
        child: (index) {
          return CustomCards(index: index);
        });
  }
}
