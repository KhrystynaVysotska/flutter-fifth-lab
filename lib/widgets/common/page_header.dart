import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key, required this.header, required this.hasArrowBack})
      : super(key: key);

  final String header;
  final bool hasArrowBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: hasArrowBack ? 20.0 : 40.0,
      ),
      child: Row(
        children: [
          if (hasArrowBack)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          Text(
            header,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff3c404a),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
