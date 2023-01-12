import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_applications/using_getx/controller/card_getx_controller.dart';
import 'package:sample_applications/widgets/card_container.dart';

class CustomCardGetx extends StatelessWidget {
  final int index;
  const CustomCardGetx({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return GetX<CardControllerGetx>(builder: ((controller) {
      final card = controller.list.value.cards[index];
      final isLoading = controller.cardStates.value.index != null &&
              controller.cardStates.value.index == index
          ? controller.cardStates.value.isLoading
          : false;
      return CardContainer(
        card: card,
        index: index,
        isLoading: isLoading,
        onTap: () {
          controller.toggleLike(index);
        },
      );
    }));
  }
}
