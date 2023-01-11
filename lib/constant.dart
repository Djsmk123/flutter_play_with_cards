import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';

List<Map<String, dynamic>> cards = [
  {
    "name": "Card 1",
    "description": "This is the first card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 6,
    "isLiked": false,
  },
  {
    "name": "Card 2",
    "description": "This is the second card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 10,
    "isLiked": true,
  },
  {
    "name": "Card 3",
    "description": "This is the third card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 13,
    "isLiked": false,
  },
  {
    "name": "Card 4",
    "description": "This is the fourth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 14,
    "isLiked": false,
  },
  {
    "name": "Card 5",
    "description": "This is the fifth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 16,
    "isLiked": false,
  },
  {
    "name": "Card 6",
    "description": "This is the sixth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 2,
    "isLiked": false,
  },
  {
    "name": "Card 7",
    "description": "This is the seventh card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 1,
    "isLiked": false,
  },
  {
    "name": "Card 8",
    "description": "This is the eighth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 2,
    "isLiked": false,
  },
  {
    "name": "Card 9",
    "description": "This is the ninth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 2,
    "isLiked": false,
  },
  {
    "name": "Card 10",
    "description": "This is the tenth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 7,
    "isLiked": false,
  },
  {
    "name": "Card 11",
    "description": "This is the eleventh card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 8,
    "isLiked": false,
  },
  {
    "name": "Card 12",
    "description": "This is the twelfth card",
    "image":
        "https://wallpapers.com/images/featured-full/cool-profile-pictures-4co57dtwk64fb7lv.jpg",
    "likes": 9,
    "isLiked": false,
  }
];

CardModel createCard(int length) {
  return CardModel(
      "Card ${length + 1}",
      "This is the new card",
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
