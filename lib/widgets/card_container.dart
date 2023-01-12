import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';

import '../constant.dart';

class CardContainer extends StatelessWidget {
  final CardModel card;
  final int index;
  final bool isLoading;
  final Function onTap;
  const CardContainer({
    Key? key,
    required this.card,
    required this.index,
    required this.isLoading,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLiked = card.isLiked;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: InkWell(
            onTap: () => onTap(),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: 300,
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
                child: !isLoading
                    ? Column(mainAxisSize: MainAxisSize.min, children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(card.image),
                                      fit: BoxFit.cover)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              !isLiked
                                  ? Icons.favorite_outline
                                  : Icons.favorite,
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
                        )
                      ])
                    : const SizedBox(
                        height: 80,
                        width: 300,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ))),
      ),
    );
  }
}
