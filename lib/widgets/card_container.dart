import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';
import 'package:sample_applications/widgets/bottom_model_sheet.dart';

import '../constant.dart';

class CardContainer extends StatelessWidget {
  final CardModel card;
  final int index;
  final bool isLoading;
  final Function onUpdate;
  final Function onTap;
  const CardContainer({
    Key? key,
    required this.card,
    required this.index,
    required this.isLoading,
    required this.onUpdate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLiked = card.isLiked;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              crossFadeState: isLoading
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: buildCard(isLiked, card, context),
              secondChild: loadingWidget(),
            )),
      ),
    );
  }

  Widget loadingWidget() {
    return SizedBox(
      height: 100,
      width: 300,
      child: Center(
          child: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Updating Card State",
            style: TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }

  Widget buildCard(isLiked, card, context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(card.image), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    card.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {
              showBottomModelSheet(context, onUpdate,
                  title: card.name, subtitle: card.description);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              !isLiked ? Icons.favorite_outline : Icons.favorite,
              color: isLiked ? Colors.red : Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              card.likes.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
