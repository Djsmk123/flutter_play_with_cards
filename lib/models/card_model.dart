import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  final String name;
  final String description;
  final String image;
  final int likes;
  final bool isLiked;

  CardModel(this.name, this.description, this.image, this.likes, this.isLiked);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  // copyWith is a method that we have created in the CardList model
  CardModel copyWith({name, description, image, likes, isLiked}) => CardModel(
        name ?? this.name,
        description ?? this.description,
        image ?? this.image,
        likes ?? this.likes,
        isLiked ?? this.isLiked,
      );
}
