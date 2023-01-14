import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';

List<Map<String, dynamic>> cardsList() {
  return List.generate(
      10,
      (index) => {
            "name": "Card $index",
            "description": "This is the $index card",
            "image": "images/default_profile_img.jpg",
            "likes": Random().nextInt(2000),
            "isLiked": false,
          });
}

CardModel createCard(title, desc) {
  return CardModel(title, desc, "images/default_profile_img.jpg", 0, false);
}

const kPrimaryColor = Color(0XFF4A5BDC);
const kSecondaryColor = Color(0XFF674FAD);
