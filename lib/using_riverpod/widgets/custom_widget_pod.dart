import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_applications/using_riverpod/core_riverpod.dart';
import 'package:sample_applications/widgets/card_container.dart';

class CustomWidgetRiverPod extends ConsumerWidget {
  final int index;
  const CustomWidgetRiverPod(this.index, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardStates = ref.watch(cardListProvider);
    final card = cardStates.cardList.cards[index];
    final bool isLoading = cardStates.cardStates.index == index
        ? cardStates.cardStates.isLoading
        : false;
    return InkWell(
      onTap: () {
        ref.read(cardListProvider.notifier).toggleLike(index);
      },
      child: CardContainer(
        card: card,
        index: index,
        isLoading: isLoading,
      ),
    );
  }
}
