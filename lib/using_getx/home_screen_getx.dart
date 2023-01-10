import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/using_getx/controller/card_getx_controller.dart';
import 'package:sample_applications/using_getx/widgets/custom_card_getx.dart';

import '../widgets/common_home_screen.dart';

class HomeScreenGetx extends StatelessWidget {
  const HomeScreenGetx({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CardControllerGetx());
    return GetX<CardControllerGetx>(builder: ((controller) {
      final cardlst = controller.list.value;
      final isLoading = controller.isLoading.value;
      return CommonHomeScreen(
        addCard: () async {
          controller.addCard(createCard(cardlst.cards.length));
        },
        cardsList: cardlst,
        child: (index) {
          return CustomCardGetx(index: index);
        },
        isLoading: isLoading,
        removeCard: (index) {
          controller.removeCard(index);
        },
        stateManement: 'Getx',
      );
    }));
  }
}
