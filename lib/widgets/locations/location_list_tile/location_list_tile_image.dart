import 'package:flutter/material.dart';

class LocationListTileImage extends StatelessWidget {
  const LocationListTileImage({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: imageUrl != ""
          ? BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageUrl),
              ),
            )
          : null,
    );
  }
}
