import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_applications/widgets/card_container.dart';

import '../providers/cards_states_provider.dart';

class CustomCardProvider extends StatelessWidget {
  final int index;
  const CustomCardProvider({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardsProvider = Provider.of<CardsStateProvider>(context);
    final card = cardsProvider.cardList.cards[index];
    final bool isLoading = cardsProvider.cardStates.index == index
        ? cardsProvider.cardStates.isLoading
        : false;
    return InkWell(
      onTap: () {
        context.read<CardsStateProvider>().likeUpdates(index);
      },
      child: CardContainer(
        card: card,
        index: index,
        isLoading: isLoading,
      ),
    );
  }
}
