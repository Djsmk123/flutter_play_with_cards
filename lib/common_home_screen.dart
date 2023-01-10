import 'package:flutter/material.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/cards_list.dart';

class CommonHomeScreen extends StatelessWidget {
  final CardList cardsList;
  final Function addCard;
  final Function removeCard;
  final bool isLoading;
  final Function child;
  final String stateManement;
  const CommonHomeScreen({
    super.key,
    required this.cardsList,
    required this.addCard,
    required this.removeCard,
    required this.isLoading,
    required this.child,
    required this.stateManement,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Card Tutorial using $stateManement"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addCard();
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: !isLoading
              ? Column(children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Dismissible(
                          onDismissed: (direction) {
                            removeCard(index);
                          },
                          key: UniqueKey(),
                          child: child(index));
                    }),
                    itemCount: cardsList.cards.length,
                  )
                ])
              : const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
        )));
  }
}
