import 'package:flutter/material.dart';
import 'package:sample_applications/constant.dart';
import 'package:sample_applications/models/cards_list.dart';
import 'package:sample_applications/widgets/bottom_model_sheet.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [kPrimaryColor, kSecondaryColor])),
            ),
          ),
          title: Text(
            "Card Tutorial using $stateManement",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomModelSheet(context, addCard);
          },
          backgroundColor: kSecondaryColor,
          child: const Icon(Icons.add),
        ),
        body: !isLoading
            ? GridView.builder(
                cacheExtent: cardsList.cards.length.toDouble(),
                itemBuilder: ((context, index) {
                  return Dismissible(
                      onDismissed: (direction) {
                        removeCard(index);
                      },
                      key: UniqueKey(),
                      child: child(index));
                }),
                itemCount: cardsList.cards.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        size.width > 600 ? (size.width > 800 ? 3 : 2) : 1,
                    mainAxisExtent: 170,
                    mainAxisSpacing: 20,
                    childAspectRatio:
                        size.width > 600 ? (size.width > 800 ? 2 : 2.5) : 3),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              ));
  }
}
