// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardList _$CardListFromJson(Map<String, dynamic> json) => CardList(
      (json['cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardListToJson(CardList instance) => <String, dynamic>{
      'cards': instance.cards,
    };
