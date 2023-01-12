import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/using_providers/providers/cards_states_provider.dart';
import 'package:sample_applications/using_providers/widgets/custom_card_provider.dart';
import 'package:sample_applications/widgets/common_home_screen.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final cardsProvider = Provider.of<CardsStateProvider>(context);
    final cardList = cardsProvider.cardList;
    final bool isLoading = cardsProvider.isLoading;
    return CommonHomeScreen(
        cardsList: cardList,
        addCard: (title, desc) {
          context.read<CardsStateProvider>().addCard(
                createCard(title, desc),
              );
        },
        removeCard: (index) {
          context.read<CardsStateProvider>().removeCard(cardList.cards[index]);
        },
        isLoading: isLoading,
        stateManement: 'Provider',
        child: (index) {
          return CustomCardProvider(index: index);
        });
  }
}
