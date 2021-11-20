import 'package:flutter/material.dart';

class RiverCardImage extends StatelessWidget {
  const RiverCardImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      child: Image(
        height: 150,
        fit: BoxFit.cover,
        width: double.infinity,
        alignment: Alignment.center,
        image: NetworkImage(imageUrl),
      ),
    );
  }
}
