import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_applications/using_riverpod/core_riverpod.dart';
import 'package:sample_applications/widgets/card_container.dart';

class CustomCardRiverPod extends ConsumerWidget {
  final int index;
  const CustomCardRiverPod(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardStates = ref.watch(cardListProvider);
    final card = cardStates.cardList.cards[index];
    final bool isLoading = cardStates.cardStates.index == index
        ? cardStates.cardStates.isLoading
        : false;
    return CardContainer(
      card: card,
      index: index,
      onTap: () {
        ref.read(cardListProvider.notifier).toggleLike(index);
      },
      onUpdate: (title, description) {
        ref
            .read(cardListProvider.notifier)
            .updateCard(index, title, description);
      },
      isLoading: isLoading,
    );
  }
}
