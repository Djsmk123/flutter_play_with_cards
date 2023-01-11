import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_applications/widgets/common_home_screen.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/using_riverpod/core_riverpod.dart';
import 'package:sample_applications/using_riverpod/widgets/custom_card_riverpod.dart';

class HomeScreenRiverPod extends ConsumerWidget {
  const HomeScreenRiverPod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardStates = ref.watch(cardListProvider);
    final cardList = cardStates.cardList;
    bool isLoading = cardStates.isLoading;

    return CommonHomeScreen(
      stateManement: "RiverPod",
      addCard: () {
        ref
            .read(cardListProvider.notifier)
            .addNewCard(createCard(cardList.cards.length));
      },
      removeCard: (index) {
        ref.read(cardListProvider.notifier).removeCard(index);
      },
      cardsList: cardList,
      child: (index) => CustomCardRiverPod(index),
      isLoading: isLoading,
    );
  }
}
