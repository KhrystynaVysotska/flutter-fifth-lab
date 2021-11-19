import 'package:flutter/material.dart';

class AlertMeasurementItem extends StatelessWidget {
  const AlertMeasurementItem({
    Key? key,
    required this.river,
    required this.location,
    required this.onPressed,
  }) : super(key: key);

  final String river;
  final String location;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 35.0, color: Colors.red[400]),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            river,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff545556),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff606064),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 15.0, color: Colors.black54),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
