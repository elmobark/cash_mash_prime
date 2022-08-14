import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      
      tag: 'userprofile',
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
        ),
        radius: 50,
      ),
    );
  }
}
