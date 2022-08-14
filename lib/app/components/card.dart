import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Map<String, dynamic> card;
  const CardItem({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'card_item_${card["id"]}',
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 18),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff2e517a).withOpacity(.32),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Parent(
              style: ParentStyle()
                ..borderRadius(all: 10)
                ..background.image(
                  imageProveder:
                      CachedNetworkImageProvider(card['image'] as String),
                  fit: BoxFit.cover,
                ),
              child: Parent(
                style: ParentStyle()
                  ..background.blur(39)
                  ..borderRadius(all: 10)
                  ..padding(all: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz_rounded,
                                color: Colors.white)),
                        Spacer(),
                        Text(
                          card['bank'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      card['cardNumber']
                          .toString()
                          .replaceRange(4, 10, ' ⦿⦿⦿⦿⦿⦿⦿ '),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          card['expireDate'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        Spacer(),
                        Text(
                          card['name'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
