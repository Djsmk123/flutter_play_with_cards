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
