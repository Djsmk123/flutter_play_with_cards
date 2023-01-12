import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';

List<Map<String, dynamic>> cardsList() {
  return List.generate(
      10,
      (index) => {
            "name": "Card $index",
            "description": "This is the $index card",
            "image":
                "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
            "likes": Random().nextInt(2000),
            "isLiked": false,
          });
}

CardModel createCard(title, desc) {
  return CardModel(
      title,
      desc,
      "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
      0,
      false);
}

const kPrimaryColor = Color(0XFF4A5BDC);
const kSecondaryColor = Color(0XFF674FAD);

class CardStatesModel {
  final bool isLoading;
  final int? index;
  const CardStatesModel(
    this.isLoading,
    this.index,
  );
  CardStatesModel copyWith({bool? isLoading, int? index}) {
    return CardStatesModel(isLoading ?? this.isLoading, index ?? this.index);
  }
}
