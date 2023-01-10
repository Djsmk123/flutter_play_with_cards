import 'package:flutter/material.dart';
import 'package:sample_applications/models/card_model.dart';

import '../constant.dart';

class CardContainer extends StatelessWidget {
  final CardModel card;
  final int index;
  final bool isLoading;
  const CardContainer({
    Key? key,
    required this.card,
    required this.index,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLiked = card.isLiked;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(
        elevation: 10,
        surfaceTintColor: kSecondaryColor,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: !isLoading
                ? Column(
                    children: [
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
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )),
      ),
    );
  }
}
