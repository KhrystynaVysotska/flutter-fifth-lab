import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'measurement_card/measurement_card.dart';

class LatestMeasurementsCarousel extends StatelessWidget {
  const LatestMeasurementsCarousel({Key? key, required this.latestMeasurements})
      : super(key: key);

  final List<LatestMeasurement> latestMeasurements;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.0,
        autoPlay: true,
        viewportFraction: 0.7,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
      ),
      items: latestMeasurements.map((measurement) {
        return Builder(
          builder: (BuildContext context) {
            return MeasurementCard(measurement: measurement);
          },
        );
      }).toList(),
    );
  }
}
