// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      json['name'] as String,
      json['description'] as String,
      json['image'] as String,
      json['likes'] as int,
      json['isLiked'] as bool,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'likes': instance.likes,
      'isLiked': instance.isLiked
    };
