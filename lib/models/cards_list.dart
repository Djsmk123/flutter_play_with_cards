import 'package:json_annotation/json_annotation.dart';
import "card_model.dart";

part 'cards_list.g.dart';

@JsonSerializable()
class CardList {
  final List<CardModel> cards;

  CardList(
    this.cards,
  );

  factory CardList.fromJson(Map<String, dynamic> json) =>
      _$CardListFromJson(json);
  Map<String, dynamic> toJson() => _$CardListToJson(this);
  CardList copyWith(cards) => CardList(
        cards ?? this.cards,
      );
}
