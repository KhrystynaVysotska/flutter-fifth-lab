import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key, required this.header}) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40.0),
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xff3c404a),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
